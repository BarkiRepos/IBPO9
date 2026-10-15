"""Build dependency-free SVG diagrams and an offline, printable guide."""
from pathlib import Path
from html import escape
import re
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parent
IMAGES = ROOT / 'images'
IMAGES.mkdir(exist_ok=True)

def diagram(name, title, subtitle, cards, footer):
    height = 200 + len(cards) * 108
    parts = [f'<svg xmlns="http://www.w3.org/2000/svg" width="1100" height="{height}" viewBox="0 0 1100 {height}" role="img" aria-labelledby="title desc">',
             f'<title id="title">{escape(title)}</title><desc id="desc">{escape(subtitle + ". " + footer)}</desc>',
             '<defs><marker id="arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto"><path d="M0 0 L8 4 L0 8" fill="#167d8d"/></marker></defs>',
             f'<rect width="1100" height="{height}" rx="18" fill="#f2f6fb"/>',
             f'<text x="40" y="49" font-family="Segoe UI,Arial,sans-serif" font-size="29" font-weight="700" fill="#132b46">{escape(title)}</text>',
             f'<text x="40" y="80" font-family="Segoe UI,Arial,sans-serif" font-size="17" fill="#465b73">{escape(subtitle)}</text>']
    for i, (heading, line1, line2) in enumerate(cards):
        y = 105 + i * 108
        if i:
            parts.append(f'<path d="M76 {y-25} V{y-5}" stroke="#167d8d" stroke-width="3" marker-end="url(#arrow)"/>')
        parts += [f'<rect x="40" y="{y}" width="1020" height="82" rx="12" fill="white" stroke="#c9d7e6"/>',
                  f'<circle cx="76" cy="{y+40}" r="20" fill="#167d8d"/>',
                  f'<text x="76" y="{y+46}" text-anchor="middle" font-family="Arial,sans-serif" font-size="18" fill="white">{i+1}</text>',
                  f'<text x="116" y="{y+27}" font-family="Segoe UI,Arial,sans-serif" font-size="20" font-weight="600" fill="#132b46">{escape(heading)}</text>',
                  f'<text x="116" y="{y+51}" font-family="Segoe UI,Arial,sans-serif" font-size="16" fill="#465b73">{escape(line1)}</text>',
                  f'<text x="116" y="{y+71}" font-family="Segoe UI,Arial,sans-serif" font-size="16" fill="#465b73">{escape(line2)}</text>']
    parts += [f'<text x="40" y="{height-30}" font-family="Segoe UI,Arial,sans-serif" font-size="16" fill="#465b73">{escape(footer)}</text>', '</svg>']
    data = '\n'.join(parts)
    ET.fromstring(data)
    (IMAGES / name).write_text(data, encoding='utf-8')

diagram('export-overview.svg', 'IBPO9: data routes', 'Choose the company, dataset and output route.', [
    ('Business Central company data', 'Materials, customers, suppliers, sales, purchasing and inventory', 'Production BOMs, routings, resources, units and quality'),
    ('Manual route: UTT O9IBP Jobs', 'Select Demand planning / Supply planning options and review dates.', 'Result: a ZIP download containing the selected export files.'),
    ('Snapshot route: O9 Snapshot Configurations', 'Save settings, choose Run Snapshot or Run All Active.', 'Result: server files plus buffer rows where supported by the exporter.'),
    ('Scheduled route: Job Queue / Codeunit 67004', 'Runs all active snapshots first, then any parameter exports.', 'Result: files in the Manufacturing Setup export folder.'),
    ('Validate and hand over to the O9 import process', 'Check headers, dates, currencies and sample business records.', 'File creation and O9 import are separate operational steps.')],
    'Illustration only | Files use UTF-8 and pipe separators | DE = IVMK; MX = IVMP')
diagram('manual-export.svg', 'Download selected exports', 'Example: Purchase Order Invoice Data for September 2026.', [
    ('Open UTT O9IBP Jobs', 'Confirm the intended Business Central company.', 'Select Purchase Order Invoice Data under Demand planning.'),
    ('Set the reporting period', 'StartDate: 1 September 2026 | EndDate: 30 September 2026', 'Distinct dates give a fixed invoice posting-date range.'),
    ('Run and save the ZIP', 'Confirm the request page and save the O9Data archive.', 'The archive contains one file for each selected export.'),
    ('Extract and inspect', 'Example: IVMK_PurchaseOrderInvoice_20261012.csv', 'Import as UTF-8 text with | delimiter; check the 49 invoice columns.')],
    'Illustration only | Filename date is the run date | Equal invoice dates expand by three years each way')
diagram('snapshot-history.svg', 'Snapshots: run, retain and inspect', 'Configurations sharing an XMLport also share their buffer group.', [
    ('Create a configuration', 'Code + XML Port Name + Description + Dates + Keep History + Active', 'Active controls batch inclusion; Run Snapshot can run an inactive selected row.'),
    ('Apply Keep History before export', 'ON: retain existing matching buffer rows.', 'OFF: delete buffer rows with the same XMLport batch name.'),
    ('Run the exporter', 'Write the server file; add buffer rows where the exporter supports them.', 'A repeated same-day filename can replace the existing file.'),
    ('Choose Show Snapshot Data', 'Rows are filtered by XML Port Name, rather than configuration Code.', 'Use Export Date and the file header to interpret Field 1 through Field 49.'),
    ('Cleanup Old Snapshots: full buffer reset', 'After confirmation, the current implementation deletes ALL export buffer rows.', 'Keep History, Active and age do not limit this cleanup. Server files remain.')],
    'Illustration only | Keeping buffer history does not archive server files')
diagram('inventory-restrictions.svg', 'OnHandInventory_SP: restriction rules', 'The restriction test applies to eligible inventory entries.', [
    ('Check the entry bin', 'Is O9 restricted Qty enabled on its bin?', 'YES: classify as restricted. NO or unavailable: check the location.'),
    ('Check the entry location', 'Is O9 blocked Qty enabled on its location?', 'YES: classify as restricted. NO: classify as unrestricted.'),
    ('Aggregate planning quantities', 'Restricted entries contribute to restricted quantity.', 'Unrestricted entries contribute to unrestricted remaining quantity.'),
    ('Run OnHandInventory_SP after changes', 'Review quantities together with item and location exclusion rules.', 'A location restriction still applies when the bin restriction is off.')],
    'Illustration only | These flags classify export quantities; they do not implement a warehouse posting block')
diagram('invoice-data.svg', 'Purchase invoice data: read the values', '49 ordered columns from nonblank-type posted purchase invoice lines; credit memos excluded.', [
    ('Select posted invoice lines by posting date', 'Distinct dates: use the entered range. Equal dates: reference date minus/plus three years.', 'Invoice Number is the internal posted document number.'),
    ('Read invoice-currency prices', 'Unit Price = Direct Unit Cost', 'Net Price = Quantity x Direct Unit Cost, before discounts.'),
    ('Read local and USD amounts', 'Local Amount = discounted line Amount excluding VAT, converted with the posted currency factor.', 'Amount = Local Amount converted to USD at the posting-date exchange rate.'),
    ('Read posted-line dimensions', 'Global Dimension 1 -> Cost Account Number / Name', 'Global Dimension 2 -> Profit Center Code / Name'),
    ('Interpret conditional and blank values', 'Payment Date requires settlement; PO details require the current order line.', 'Eight template columns are unmapped. See the guide for their names.')],
    'Illustration only | USD rates are required unless LCY is USD | Plant: DE = IVMK; MX = IVMP')

def inline(text):
    text = escape(text)
    text = re.sub(r'`([^`]+)`', r'<code>\1</code>', text)
    text = re.sub(r'\*\*([^*]+)\*\*', r'<strong>\1</strong>', text)
    text = re.sub(r'!\[([^]]*)\]\(([^)]+)\)', r'<img alt="\1" src="\2" loading="lazy">', text)
    return re.sub(r'\[([^]]+)\]\(([^)]+)\)', r'<a href="\2">\1</a>', text)

lines = (ROOT / 'USER_GUIDE.md').read_text(encoding='utf-8').splitlines()
output = []
i = 0
while i < len(lines):
    line = lines[i]
    if not line.strip():
        i += 1
        continue
    heading = re.match(r'^(#+) (.*)', line)
    if heading:
        level, title = len(heading[1]), heading[2]
        anchor = re.sub(r'[^a-z0-9 -]', '', title.lower()).replace(' ', '-')
        output.append(f'<h{level} id="{anchor}">{inline(title)}</h{level}>')
    elif line.startswith('|'):
        rows = []
        while i < len(lines) and lines[i].startswith('|'):
            cells = [c.strip() for c in re.split(r'(?<!`)\|(?!`)', lines[i].strip('|'))]
            if not all(re.fullmatch(r'[- :]+', c) for c in cells):
                tag = 'th' if not rows else 'td'
                rows.append('<tr>' + ''.join(f'<{tag}>{inline(c)}</{tag}>' for c in cells) + '</tr>')
            i += 1
        output.append('<div class="table"><table>' + ''.join(rows) + '</table></div>')
        continue
    elif re.match(r'^\d+\. ', line):
        items = []
        while i < len(lines) and re.match(r'^\d+\. ', lines[i]):
            items.append('<li>' + inline(re.sub(r'^\d+\. ', '', lines[i])) + '</li>')
            i += 1
        output.append('<ol>' + ''.join(items) + '</ol>')
        continue
    else:
        output.append('<p>' + inline(line) + '</p>')
    i += 1

css = '''body{margin:0;background:#f2f6fb;color:#22364d;font:16px/1.65 "Segoe UI",Arial,sans-serif}main{max-width:1050px;margin:32px auto;padding:48px;background:white;border-radius:16px}h1,h2{color:#132b46;line-height:1.25}h1{font-size:38px}h2{margin-top:46px;border-top:2px solid #dfebf2;padding-top:25px}a{color:#087889}img{display:block;width:100%;height:auto;margin:24px 0}table{border-collapse:collapse;width:100%;font-size:15px}td,th{padding:12px;text-align:left;border:1px solid #d5e0ea;vertical-align:top}th{background:#eaf3f6}tr:nth-child(even){background:#f8fafc}code{background:#eef3f7;padding:2px 4px;overflow-wrap:anywhere}.table{overflow-x:auto}li{margin:7px 0}@media(max-width:700px){main{margin:0;padding:22px;border-radius:0}h1{font-size:29px}}@media print{body{background:white;font-size:11pt}main{margin:0;padding:0;max-width:none}h2{break-after:avoid}img,tr{break-inside:avoid}a{color:inherit}table{font-size:10pt}}'''
(ROOT / 'USER_GUIDE.html').write_text('<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>IBPO9 user guide</title><style>' + css + '</style></head><body><main>' + '\n'.join(output) + '</main></body></html>', encoding='utf-8')

for target in re.findall(r'\]\(([^)]+)\)', '\n'.join(lines)):
    if not target.startswith('#'):
        assert (ROOT / target).exists(), f'Missing documentation target: {target}'
html = (ROOT / 'USER_GUIDE.html').read_text(encoding='utf-8')
ids = set(re.findall(r'id="([^"]+)"', html))
assert all(a in ids for a in re.findall(r'href="#([^"]+)"', html))
image_targets = re.findall(r'!\[[^]]*\]\(([^)]+)\)', '\n'.join(lines))
assert html.count('<img ') == len(image_targets)
assert all((ROOT / target).is_file() for target in image_targets)
print(f'Built HTML guide with {len(image_targets)} images and 5 SVG diagrams. Validated local links, HTML anchors, image references and SVG XML.')
