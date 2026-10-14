# Purchase KPI SP export context

## Entry point and format

`UTTO9POKPI_SP_XmlPort.al` defines XMLport 67029, `UTT O9 Purchase Export_SP`.

- Export-only VariableText format, UTF-8 encoding, pipe (`|`) field separator, and newline table separator.
- No request page; declared filename: `IVMK_PO_KPI_SP_dsv`.
- The schema emits a header, purchase-line rows, and posted purchase-receipt-line rows.
- `SetDataFilter(PStartDate, PEndDate)` sets the date range used by both data sections.
- Codeunit `UTT O9 Project Lib`, procedure `PurchaseExport_SP`, sets the filter and destination stream, then calls `Export()`.
- When the library's reference start and end dates are equal, this procedure expands the range to three years before and after that date. Its nearby comment about one year does not match the code.

## Row selection

Open rows select item purchase lines for Orders and Blanket Orders, with planned receipt dates in the configured range and positive outstanding quantity.

Receipt rows select item purchase receipt lines with posting dates in the configured range and positive quantity.

Company country determines the exported plant and location filter:

| Country | Plant | Included locations |
| --- | --- | --- |
| DE | IVMK | KETTBAUM, KOMBILINE, GARNLAGER |
| MX | IVMP | ALMHILO, ALMPROACA, ALMLAM |

## Column contract

The header and both data sections use these 23 positions, mirrored into the corresponding numbered buffer fields:

1. POHeaderID_LineID
2. POCreationDate
3. Supplier
4. MatlNumber
5. Location
6. TransMode
7. POCommitQuantity
8. UOMofPOCommitQuantity
9. POCommittedDeliveryDate
10. Status
11. POGoodsReceiptDate
12. POGoodsReceiptQuantity
13. UOMofPOGoodsReceiptQuantity
14. POreleaseStatus
15. POOpenQuantity
16. UoMPOOpenQuantity
17. POType
18. SalesOrderLineID
19. MaterialDescription
20. Quality
21. POBookPricePerUnit
22. NetPurchaseCost
23. PurchaseCostCurrency

## Implementation details to preserve

- Header and data records create persistent `UTT IBPO9 Buffer` rows; field triggers populate them with `Modify()` calls.
- Buffer metadata includes entry number, export timestamp, and the object name resolved from XMLport ID 67029.
- Dates use `YYYY/MM/DD`; quantities and costs commonly use `Format(value, 0, 9)`.
- Empty purchase currency falls back to General Ledger Setup's LCY Code.
- Document-line identifiers are assembled with `%1-%2`; receipt identifiers use receipt document and line numbers.
- Some lookups use unconditional `Get()` calls, so missing referenced records can fail the export.

## Review checklist for changes

Check header and both row sections together when adding or reordering a column. Confirm matching buffer positions, open versus received quantities, receipt date filters, company-specific locations, currency fallback, and output formatting. Compare with `UTTO9POKPI.XmlPort.al` when useful, but verify its behavior independently before copying logic.
