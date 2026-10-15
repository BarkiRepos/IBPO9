# Purchase invoice export

XMLport 67033 exports all nonblank-type posted purchase invoice lines in template column order, filtered by posting date. Credit memos are excluded. No plant filter is applied.

Run from the Purchase Order Invoice Data option in O9 Project Jobs, job queue parameter `PO_INVOICE`, or snapshot XMLport name `UTT O9 Purchase Invoice`. Date ranges follow `PurchaseExport_SP`: equal reference dates expand to three years before and after that date; different reference dates are passed through unchanged. Buffer columns 37-49 are added to the buffer table; stored values retain the existing 100-character limit.

Invoice Number is the internal posted invoice number. Unit Price is Direct Unit Cost in invoice currency; Net Price is quantity times that cost before discounts. Local Amount uses invoice line Amount (excluding VAT, including discounts) converted with the posted header currency factor. Amount converts that LCY amount to USD at the posting-date exchange rate; a configured USD currency and rate are required unless LCY is USD.

PO descriptions and UOM come from the current order when still available; otherwise they are blank. PO Payment terms use the posted invoice header payment terms. Material Type follows the material dimension textile/BOM classification and 09_MAT_TYP translation. Material Category follows its ProductTypeCode mapping through 09_MATDIM_PROD_TYP1 using Item Category Code, defaulting to Flat Fabric. Payment Date is the fully settled vendor ledger entry closing date, not a partial payment date. Incoterms uses Shipment Method Code. Company Code uses the Business Central company name. Plant uses the PO KPI company-country mapping: DE = IVMK, MX = IVMP, otherwise blank. Plant Name uses the same value, matching the location dimension planning location description. WBS uses Job Task No. and Description. G/L fields are populated only for explicit G/L Account lines; item lines do not infer a posted expense account.

Unmapped columns are blank: Material Group, Material Group Name, Category, Sub-Category, Commodity, Segment, Contract ID, Cost Account Type.

These fields need confirmed company-specific mappings before they can be populated.

Cost Account Number and Cost Account Name use Global Dimension 1 Code from General Ledger Setup (Kostenstelle). Profit Center Code and Profit Center Name use Global Dimension 2 Code (Kostentraeger). For each configured dimension code, Dimension Set Entry is looked up using the posted invoice line Dimension Set ID. Codes come from Dimension Value Code; names come from Dimension Value.Name. Missing setup codes or dimension entries produce blank values. No dimension-name search or Cost Accounting Setup lookup is used.

## Field mapping

Updated 2026-10-12 from `UTTPO_InvoiceSPCude.XmlPort.al`. This table matches columns F-I of the Excel workbook.

| Position | Requested field | Applicability | Source tables | Source fields / calculation | Join / notes |
| --- | --- | --- | --- | --- | --- |
| 1 | Vendor ID | Yes | Purch. Inv. Header (122) | Buy-from Vendor No. | Purch. Inv. Header.No. = Purch. Inv. Line.Document No. |
| 2 | Vendor Name | Yes | Purch. Inv. Header (122) | Buy-from Vendor Name | Purch. Inv. Header.No. = Purch. Inv. Line.Document No. |
| 3 | Invoice Posting Date | Yes | Purch. Inv. Header (122) | Posting Date | Purch. Inv. Header.No. = Purch. Inv. Line.Document No. |
| 4 | Invoice Number | Yes | Purch. Inv. Line (123) | Document No. | Base table; Posting Date filtered by export date range; Type <> blank. |
| 5 | Invoice Line Number | Yes | Purch. Inv. Line (123) | Line No. | Base table; Posting Date filtered by export date range; Type <> blank. |
| 6 | Invoice Line Description | Yes | Purch. Inv. Line (123) | Description | Base table; Posting Date filtered by export date range; Type <> blank. |
| 7 | PO Number | Yes | Purch. Inv. Line (123) | Order No. | Base table; Posting Date filtered by export date range; Type <> blank. |
| 8 | PO Line Number | Yes | Purch. Inv. Line (123) | Order Line No. | Base table; Posting Date filtered by export date range; Type <> blank. |
| 9 | PO Line Description | Yes | Purchase Line (39) | Description | Purchase Line.Document Type = Order; Document No. = invoice line Order No.; Line No. = invoice line Order Line No. Blank if order no longer exists. |
| 10 | Material ID | Yes | Purch. Inv. Line (123) | No. | Base table; Posting Date filtered by export date range; Type <> blank. |
| 11 | Material Description | Yes | Item (27) | Description | Item.No. = Purch. Inv. Line.No.; invoice line Type = Item. |
| 12 | Material Type | Yes - calculated | Item (27); Production BOM Header (99000771); KVS IVL Translation Table | KVSTEX Item Type; Production BOM No.; Translation | Item.No. = Purch. Inv. Line.No.; invoice line Type = Item. Finished Product/Cutset/Colour Ribbon => finished goods. Other types: existing BOM => Semi Finished Goods, otherwise Raw Material. For other types only: translation override Object ID=27, Object Type=Table, ID=09_MAT_TYP, Field Value=Item.No., nonempty Translation. |
| 13 | Material Category | Yes - translated | Item (27); KVS IVL Translation Table | Item Category Code; Translation | Item.No. = Purch. Inv. Line.No.; invoice line Type = Item. Translation: Object ID=5722, Object Type=Table, ID=09_MATDIM_PROD_TYP1, Field Value=Item.Item Category Code. Default Flat Fabric if absent/empty. |
| 14 | Material Group | Not mapped | Not mapped | Blank in current XMLport | Company-specific mapping required; no source assigned in current implementation. |
| 15 | Material Group Name | Not mapped | Not mapped | Blank in current XMLport | Company-specific mapping required; no source assigned in current implementation. |
| 16 | Quantity | Yes | Purch. Inv. Line (123) | Quantity | Base posted invoice line; numeric output via Format(Quantity, 0, 9). |
| 17 | UOM Invoice | Yes | Purch. Inv. Line (123) | Unit of Measure Code | Base table; Posting Date filtered by export date range; Type <> blank. |
| 18 | Unit Price  | Yes | Purch. Inv. Line (123) | Direct Unit Cost | Base table; Posting Date filtered by export date range; Type <> blank. |
| 19 | Net Price | Yes - calculated | Purch. Inv. Line (123) | Quantity * Direct Unit Cost (invoice currency, before discounts) | Base table; Posting Date filtered by export date range; Type <> blank. |
| 20 | UOM PO | Yes | Purchase Line (39) | Unit of Measure Code | Purchase Line.Document Type = Order; Document No. = invoice line Order No.; Line No. = invoice line Order Line No. Blank if order no longer exists. |
| 21 | Local Currency | Yes | General Ledger Setup (98) | LCY Code | General Ledger Setup singleton (Get). |
| 22 | Local Amount | Yes - calculated | Purch. Inv. Line (123); Purch. Inv. Header (122); Currency Exchange Rate (330) | Amount; Currency Code; Currency Factor; Posting Date | Header joined by Document No. Line Amount excludes VAT and includes discounts. If invoice currency blank: line Amount; otherwise ExchangeAmtFCYToLCY using posted header currency factor. |
| 23 | Amount | Yes - calculated | Currency Exchange Rate (330); General Ledger Setup (98); Purch. Inv. Header (122) | LCY Code; Posting Date; USD exchange rate | Use Local Amount directly if LCY=USD; otherwise ExchangeAmtLCYToFCY at invoice posting date with USD ExchangeRate. Requires USD currency/rate setup. |
| 24 | Category | Not mapped | Not mapped | Blank in current XMLport | Company-specific mapping required; no source assigned in current implementation. |
| 25 | Sub-Category | Not mapped | Not mapped | Blank in current XMLport | Company-specific mapping required; no source assigned in current implementation. |
| 26 | Commodity | Not mapped | Not mapped | Blank in current XMLport | Company-specific mapping required; no source assigned in current implementation. |
| 27 | Document Date | Yes | Purch. Inv. Header (122) | Document Date | Purch. Inv. Header.No. = Purch. Inv. Line.Document No. |
| 28 | Payment Method | Yes | Purch. Inv. Header (122) | Payment Method Code | Purch. Inv. Header.No. = Purch. Inv. Line.Document No. |
| 29 | PO Payment terms | Yes - posted terms | Purch. Inv. Header (122) | Payment Terms Code | Purch. Inv. Header.No. = Purch. Inv. Line.Document No. Uses posted invoice terms, not a live PO lookup. |
| 30 | Vendor Payment terms | Yes | Vendor (23) | Payment Terms Code | Vendor.No. = Purch. Inv. Header.Buy-from Vendor No. |
| 31 | Payment Date | Yes - conditional | Vendor Ledger Entry (25) | Closed at Date | Vendor Ledger Entry.Entry No. = invoice header Vendor Ledger Entry No.; Open = false. Closing date, not partial payment date. |
| 32 | Posting Date | Yes | Purch. Inv. Header (122) | Posting Date | Purch. Inv. Header.No. = Purch. Inv. Line.Document No. |
| 33 | Segment | Not mapped | Not mapped | Blank in current XMLport | Company-specific mapping required; no source assigned in current implementation. |
| 34 | Company Code | Yes - runtime | Business Central company context | CompanyName() | Current company name; no table join. |
| 35 | Company Name | Yes | Company Information (79) | Name | Company Information singleton (Get). |
| 36 | Country | Yes | Company Information (79) | Country/Region Code | Company Information singleton (Get). |
| 37 | Plant | Yes - calculated | Company Information (79) | Country/Region Code | Company Information singleton. DE => IVMK; MX => IVMP; other countries => blank. Plant Name equals Plant; no Location lookup. |
| 38 | Plant Name | Yes - calculated | Company Information (79) | Country/Region Code | Company Information singleton. DE => IVMK; MX => IVMP; other countries => blank. Plant Name equals Plant; no Location lookup. |
| 39 | Incoterms | Yes - code | Purch. Inv. Header (122) | Shipment Method Code | Purch. Inv. Header.No. = Purch. Inv. Line.Document No. Exported as Incoterms; confirm shipment method codes match required Incoterms. |
| 40 | Contract ID | Not mapped | Not mapped | Blank in current XMLport | Company-specific mapping required; no source assigned in current implementation. |
| 41 | Cost Account Number | Yes - dimension | General Ledger Setup (98); Purch. Inv. Line (123); Dimension Set Entry (480) | Global Dimension 1 Code; Dimension Set ID; Dimension Value Code | GL Setup Global Dimension 1 Code identifies Kostenstelle (Cost Account). Dimension Set Entry.Dimension Set ID = invoice line Dimension Set ID AND Dimension Code = configured global dimension code. Blank if code or entry absent. No Cost Accounting Setup or dimension-name lookup. |
| 42 | Cost Account Name | Yes - dimension | General Ledger Setup (98); Purch. Inv. Line (123); Dimension Set Entry (480); Dimension Value (349) | Global Dimension 1 Code; Dimension Set ID; Dimension Value.Name | GL Setup Global Dimension 1 Code identifies Kostenstelle (Cost Account). Dimension Set Entry.Dimension Set ID = invoice line Dimension Set ID AND Dimension Code = configured global dimension code. Dimension Value.Code = entry Dimension Value Code AND Dimension Code = entry Dimension Code. Blank if code or entry absent. No Cost Accounting Setup or dimension-name lookup. |
| 43 | Profit Center Code | Yes - dimension | General Ledger Setup (98); Purch. Inv. Line (123); Dimension Set Entry (480) | Global Dimension 2 Code; Dimension Set ID; Dimension Value Code | GL Setup Global Dimension 2 Code identifies Kostentraeger (Profit Center). Dimension Set Entry.Dimension Set ID = invoice line Dimension Set ID AND Dimension Code = configured global dimension code. Blank if code or entry absent. No Cost Accounting Setup or dimension-name lookup. |
| 44 | Profit Center Name | Yes - dimension | General Ledger Setup (98); Purch. Inv. Line (123); Dimension Set Entry (480); Dimension Value (349) | Global Dimension 2 Code; Dimension Set ID; Dimension Value.Name | GL Setup Global Dimension 2 Code identifies Kostentraeger (Profit Center). Dimension Set Entry.Dimension Set ID = invoice line Dimension Set ID AND Dimension Code = configured global dimension code. Dimension Value.Code = entry Dimension Value Code AND Dimension Code = entry Dimension Code. Blank if code or entry absent. No Cost Accounting Setup or dimension-name lookup. |
| 45 | G/L Account | Yes | Purch. Inv. Line (123) | No. | Base table; Posting Date filtered by export date range; Type <> blank. |
| 46 | GL Account Description | Yes | G/L Account (15) | Name | G/L Account.No. = invoice line No.; Type = G/L Account only. |
| 47 | Cost Account Type | Not mapped | Not mapped | Blank in current XMLport | Company-specific mapping required; no source assigned in current implementation. |
| 48 | WBS Element | Yes | Purch. Inv. Line (123) | Job Task No. | Base table; Posting Date filtered by export date range; Type <> blank. |
| 49 | WBS Description | Yes | Job Task (1001) | Description | Job Task.Job No. = invoice line Job No.; Job Task No. = invoice line Job Task No. |
