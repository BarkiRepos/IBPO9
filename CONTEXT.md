# IBPO9 project context

This repository contains a Microsoft Dynamics 365 Business Central AL extension for O9 data exports and snapshots.

## Application

- Name / publisher: IBPO9 / Barki.
- Manifest: `app.json`; version at documentation creation: `18.5.26.08031552`.
- Target: OnPrem; application version: `18.5.0.0`; AL runtime: `7.2`.
- Object ID range: `67000` through `67999`.
- Dependencies: KUMAVISION textile, KUMAVISION factory, Quality Management Extension, KVS Anpassungen, and EDX. See the manifest for exact dependency IDs and versions.
- TranslationFile is enabled; translation resources live in `Translations/`.

## Source layout

- `src/xmlport/`: exports for materials, suppliers, customers, sales, purchasing, inventory, production, resources, quality, locations, and units of measure.
- `src/codeunit/UTTO9ProjectLib.Codeunit.al`: codeunit 67004, `UTT O9 Project Lib`; coordinates exports, date ranges, ZIP output, snapshots, and buffer cleanup.
- `src/report/UTTO9ProjectJobs.Report.al`: processing-only report 67035, `UTT O9 Project Jobs`; runs selected exports and adds output to a ZIP archive.
- `src/table/`: export and sales buffers plus snapshot configuration.
- `src/page/`: buffer viewing and snapshot configuration UI.
- `src/tableextension/` and `src/pageextension/`: manufacturing setup, location, and bin extensions.
- `.alpackages/`: local dependency symbols; root `.app` files are compiled extension packages.

## Snapshot and export behavior

`UTTO9SnapshotConfig` stores configuration including date ranges, a date formula, XMLport name, active status, and `KeepHistory`. The project library's `CleanBuffer` exits when history is retained; otherwise it deletes buffer rows matching the configured XMLport name in `Export Batch ID`.

Exports can write persistent rows to `UTT IBPO9 Buffer` as well as an output stream. Review these side effects when changing export logic or running exports against a company.

## Current focus

The active file when these notes were created was `src/xmlport/UTTO9POKPI_SP_XmlPort.al`. Its detailed context is in [the purchase export notes](src/xmlport/CONTEXT.md).

## Development and validation

Use the VS Code AL tooling and the matching dependency symbols to compile the extension. Validate export changes in a suitable Business Central company by checking output column order, header labels, filters, date and number formatting, and corresponding buffer values. No automated AL test source was identified during this documentation pass.

Keep object IDs within the manifest range and preserve existing export contracts unless a contract change is intended. Update these notes when behavior changes; source files and `app.json` remain authoritative.
