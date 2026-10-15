xmlport 67033 "UTT O9 Purchase Invoice"
{
    Caption = 'O9 Purchase Order Invoice Data';
    Format = VariableText;
    Direction = Export;
    TextEncoding = UTF8;
    UseRequestPage = false;
    FileName = 'PurchaseOrderInvoice.dsv';
    TableSeparator = '<NewLine>';
    FieldSeparator = '|';
    schema
    {
        textelement(Root)
        {
            tableelement(Header; Integer)
            {
                SourceTableView = sorting(Number) where(Number = const(1));
                textelement(Header1)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header1 := 'Vendor ID';
                    end;
                }
                textelement(Header2)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header2 := 'Vendor Name';
                    end;
                }
                textelement(Header3)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header3 := 'Invoice Posting Date';
                    end;
                }
                textelement(Header4)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header4 := 'Invoice Number';
                    end;
                }
                textelement(Header5)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header5 := 'Invoice Line Number';
                    end;
                }
                textelement(Header6)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header6 := 'Invoice Line Description';
                    end;
                }
                textelement(Header7)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header7 := 'PO Number';
                    end;
                }
                textelement(Header8)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header8 := 'PO Line Number';
                    end;
                }
                textelement(Header9)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header9 := 'PO Line Description';
                    end;
                }
                textelement(Header10)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header10 := 'Material ID';
                    end;
                }
                textelement(Header11)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header11 := 'Material Description';
                    end;
                }
                textelement(Header12)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header12 := 'Material Type';
                    end;
                }
                textelement(Header13)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header13 := 'Material Category';
                    end;
                }
                textelement(Header14)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header14 := 'Material Group';
                    end;
                }
                textelement(Header15)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header15 := 'Material Group Name';
                    end;
                }
                textelement(Header16)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header16 := 'Quantity';
                    end;
                }
                textelement(Header17)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header17 := 'UOM Invoice';
                    end;
                }
                textelement(Header18)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header18 := 'Unit Price';
                    end;
                }
                textelement(Header19)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header19 := 'Net Price';
                    end;
                }
                textelement(Header20)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header20 := 'UOM PO';
                    end;
                }
                textelement(Header21)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header21 := 'Local Currency';
                    end;
                }
                textelement(Header22)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header22 := 'Local Amount';
                    end;
                }
                textelement(Header23)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header23 := 'Amount';
                    end;
                }
                textelement(Header24)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header24 := 'Category';
                    end;
                }
                textelement(Header25)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header25 := 'Sub-Category';
                    end;
                }
                textelement(Header26)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header26 := 'Commodity';
                    end;
                }
                textelement(Header27)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header27 := 'Document Date';
                    end;
                }
                textelement(Header28)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header28 := 'Payment Method';
                    end;
                }
                textelement(Header29)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header29 := 'PO Payment terms';
                    end;
                }
                textelement(Header30)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header30 := 'Vendor Payment terms';
                    end;
                }
                textelement(Header31)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header31 := 'Payment Date';
                    end;
                }
                textelement(Header32)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header32 := 'Posting Date';
                    end;
                }
                textelement(Header33)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header33 := 'Segment';
                    end;
                }
                textelement(Header34)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header34 := 'Company Code';
                    end;
                }
                textelement(Header35)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header35 := 'Company Name';
                    end;
                }
                textelement(Header36)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header36 := 'Country';
                    end;
                }
                textelement(Header37)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header37 := 'Plant';
                    end;
                }
                textelement(Header38)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header38 := 'Plant Name';
                    end;
                }
                textelement(Header39)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header39 := 'Incoterms';
                    end;
                }
                textelement(Header40)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header40 := 'Contract ID';
                    end;
                }
                textelement(Header41)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header41 := 'Cost Account Number';
                    end;
                }
                textelement(Header42)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header42 := 'Cost Account Name';
                    end;
                }
                textelement(Header43)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header43 := 'Profit Center Code';
                    end;
                }
                textelement(Header44)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header44 := 'Profit Center Name';
                    end;
                }
                textelement(Header45)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header45 := 'G/L Account';
                    end;
                }
                textelement(Header46)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header46 := 'GL Account Description';
                    end;
                }
                textelement(Header47)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header47 := 'Cost Account Type';
                    end;
                }
                textelement(Header48)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header48 := 'WBS Element';
                    end;
                }
                textelement(Header49)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Header49 := 'WBS Description';
                    end;
                }
                trigger OnAfterGetRecord()
                begin
                    Clear(Values);
                    Values[1] := 'Vendor ID';
                    Values[2] := 'Vendor Name';
                    Values[3] := 'Invoice Posting Date';
                    Values[4] := 'Invoice Number';
                    Values[5] := 'Invoice Line Number';
                    Values[6] := 'Invoice Line Description';
                    Values[7] := 'PO Number';
                    Values[8] := 'PO Line Number';
                    Values[9] := 'PO Line Description';
                    Values[10] := 'Material ID';
                    Values[11] := 'Material Description';
                    Values[12] := 'Material Type';
                    Values[13] := 'Material Category';
                    Values[14] := 'Material Group';
                    Values[15] := 'Material Group Name';
                    Values[16] := 'Quantity';
                    Values[17] := 'UOM Invoice';
                    Values[18] := 'Unit Price';
                    Values[19] := 'Net Price';
                    Values[20] := 'UOM PO';
                    Values[21] := 'Local Currency';
                    Values[22] := 'Local Amount';
                    Values[23] := 'Amount';
                    Values[24] := 'Category';
                    Values[25] := 'Sub-Category';
                    Values[26] := 'Commodity';
                    Values[27] := 'Document Date';
                    Values[28] := 'Payment Method';
                    Values[29] := 'PO Payment terms';
                    Values[30] := 'Vendor Payment terms';
                    Values[31] := 'Payment Date';
                    Values[32] := 'Posting Date';
                    Values[33] := 'Segment';
                    Values[34] := 'Company Code';
                    Values[35] := 'Company Name';
                    Values[36] := 'Country';
                    Values[37] := 'Plant';
                    Values[38] := 'Plant Name';
                    Values[39] := 'Incoterms';
                    Values[40] := 'Contract ID';
                    Values[41] := 'Cost Account Number';
                    Values[42] := 'Cost Account Name';
                    Values[43] := 'Profit Center Code';
                    Values[44] := 'Profit Center Name';
                    Values[45] := 'G/L Account';
                    Values[46] := 'GL Account Description';
                    Values[47] := 'Cost Account Type';
                    Values[48] := 'WBS Element';
                    Values[49] := 'WBS Description';
                    SaveBuffer();
                end;
            }
            tableelement(InvoiceLine; "Purch. Inv. Line")
            {
                SourceTableView = sorting("Document No.", "Line No.") where(Type = filter(<> " "));
                textelement(Column1)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column1 := Values[1];
                    end;
                }
                textelement(Column2)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column2 := Values[2];
                    end;
                }
                textelement(Column3)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column3 := Values[3];
                    end;
                }
                textelement(Column4)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column4 := Values[4];
                    end;
                }
                textelement(Column5)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column5 := Values[5];
                    end;
                }
                textelement(Column6)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column6 := Values[6];
                    end;
                }
                textelement(Column7)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column7 := Values[7];
                    end;
                }
                textelement(Column8)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column8 := Values[8];
                    end;
                }
                textelement(Column9)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column9 := Values[9];
                    end;
                }
                textelement(Column10)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column10 := Values[10];
                    end;
                }
                textelement(Column11)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column11 := Values[11];
                    end;
                }
                textelement(Column12)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column12 := Values[12];
                    end;
                }
                textelement(Column13)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column13 := Values[13];
                    end;
                }
                textelement(Column14)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column14 := Values[14];
                    end;
                }
                textelement(Column15)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column15 := Values[15];
                    end;
                }
                textelement(Column16)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column16 := Values[16];
                    end;
                }
                textelement(Column17)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column17 := Values[17];
                    end;
                }
                textelement(Column18)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column18 := Values[18];
                    end;
                }
                textelement(Column19)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column19 := Values[19];
                    end;
                }
                textelement(Column20)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column20 := Values[20];
                    end;
                }
                textelement(Column21)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column21 := Values[21];
                    end;
                }
                textelement(Column22)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column22 := Values[22];
                    end;
                }
                textelement(Column23)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column23 := Values[23];
                    end;
                }
                textelement(Column24)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column24 := Values[24];
                    end;
                }
                textelement(Column25)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column25 := Values[25];
                    end;
                }
                textelement(Column26)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column26 := Values[26];
                    end;
                }
                textelement(Column27)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column27 := Values[27];
                    end;
                }
                textelement(Column28)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column28 := Values[28];
                    end;
                }
                textelement(Column29)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column29 := Values[29];
                    end;
                }
                textelement(Column30)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column30 := Values[30];
                    end;
                }
                textelement(Column31)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column31 := Values[31];
                    end;
                }
                textelement(Column32)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column32 := Values[32];
                    end;
                }
                textelement(Column33)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column33 := Values[33];
                    end;
                }
                textelement(Column34)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column34 := Values[34];
                    end;
                }
                textelement(Column35)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column35 := Values[35];
                    end;
                }
                textelement(Column36)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column36 := Values[36];
                    end;
                }
                textelement(Column37)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column37 := Values[37];
                    end;
                }
                textelement(Column38)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column38 := Values[38];
                    end;
                }
                textelement(Column39)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column39 := Values[39];
                    end;
                }
                textelement(Column40)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column40 := Values[40];
                    end;
                }
                textelement(Column41)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column41 := Values[41];
                    end;
                }
                textelement(Column42)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column42 := Values[42];
                    end;
                }
                textelement(Column43)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column43 := Values[43];
                    end;
                }
                textelement(Column44)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column44 := Values[44];
                    end;
                }
                textelement(Column45)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column45 := Values[45];
                    end;
                }
                textelement(Column46)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column46 := Values[46];
                    end;
                }
                textelement(Column47)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column47 := Values[47];
                    end;
                }
                textelement(Column48)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column48 := Values[48];
                    end;
                }
                textelement(Column49)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Column49 := Values[49];
                    end;
                }
                trigger OnPreXmlItem()
                begin
                    CompanyInfo.Get();
                    GLSetup.Get();
                    if (StartDate <> 0D) or (EndDate <> 0D) then
                        InvoiceLine.SetRange("Posting Date", StartDate, EndDate);
                end;

                trigger OnAfterGetRecord()
                begin
                    BuildValues();
                    SaveBuffer();
                end;
            }
        }
    }

    procedure SetDataFilter(NewStartDate: Date; NewEndDate: Date)
    begin
        StartDate := NewStartDate;
        EndDate := NewEndDate;
    end;

    local procedure BuildValues()
    var
        LocalAmount: Decimal;
    begin
        Clear(Values);
        InvoiceHeader.Get(InvoiceLine."Document No.");
        Clear(Vendor);
        Clear(Item);
        Clear(PurchaseLine);
        Vendor.Get(InvoiceHeader."Buy-from Vendor No.");
        if InvoiceLine.Type = InvoiceLine.Type::Item then
            if Item.Get(InvoiceLine."No.") then;
        if InvoiceLine."Order No." <> '' then
            if PurchaseLine.Get(PurchaseLine."Document Type"::Order, InvoiceLine."Order No.", InvoiceLine."Order Line No.") then;
        Values[1] := InvoiceHeader."Buy-from Vendor No.";
        Values[2] := InvoiceHeader."Buy-from Vendor Name";
        Values[3] := DateText(InvoiceHeader."Posting Date");
        Values[4] := InvoiceLine."Document No.";
        Values[5] := Format(InvoiceLine."Line No.", 0, 9);
        Values[6] := InvoiceLine.Description;
        Values[7] := InvoiceLine."Order No.";
        Values[8] := Format(InvoiceLine."Order Line No.", 0, 9);
        Values[9] := PurchaseLine.Description;
        Values[16] := Format(InvoiceLine.Quantity, 0, 9);
        Values[17] := InvoiceLine."Unit of Measure Code";
        Values[18] := Format(InvoiceLine."Direct Unit Cost", 0, 9);
        Values[19] := Format(InvoiceLine.Quantity * InvoiceLine."Direct Unit Cost", 0, 9);
        Values[20] := PurchaseLine."Unit of Measure Code";
        Values[21] := GLSetup."LCY Code";
        Values[27] := DateText(InvoiceHeader."Document Date");
        Values[28] := InvoiceHeader."Payment Method Code";
        Values[29] := InvoiceHeader."Payment Terms Code";
        Values[30] := Vendor."Payment Terms Code";
        Values[32] := DateText(InvoiceHeader."Posting Date");
        Values[34] := CompanyName();
        Values[35] := CompanyInfo.Name;
        Values[36] := CompanyInfo."Country/Region Code";
        case CompanyInfo."Country/Region Code" of
            'DE':
                Values[37] := 'IVMK';
            'MX':
                Values[37] := 'IVMP';
        end;
        Values[38] := Values[37];
        Values[39] := InvoiceHeader."Shipment Method Code";
        Values[48] := InvoiceLine."Job Task No.";
        SetCostAccountFromDimensions();
        if InvoiceLine.Type = InvoiceLine.Type::Item then begin
            Values[10] := InvoiceLine."No.";
            Values[11] := Item.Description;
            if Item."No." <> '' then begin
                Values[12] := GetMaterialType();
                Values[13] := GetMaterialCategory();
            end;
        end;
        if InvoiceHeader."Currency Code" = '' then
            LocalAmount := InvoiceLine.Amount
        else
            LocalAmount := ExchangeRate.ExchangeAmtFCYToLCY(InvoiceHeader."Posting Date", InvoiceHeader."Currency Code", InvoiceLine.Amount, InvoiceHeader."Currency Factor");
        Values[22] := Format(LocalAmount, 0, 9);
        if GLSetup."LCY Code" = 'USD' then
            Values[23] := Values[22]
        else
            Values[23] := Format(ExchangeRate.ExchangeAmtLCYToFCY(InvoiceHeader."Posting Date", 'USD', LocalAmount, ExchangeRate.ExchangeRate(InvoiceHeader."Posting Date", 'USD')), 0, 9);
        if VendorEntry.Get(InvoiceHeader."Vendor Ledger Entry No.") then
            if not VendorEntry.Open then
                Values[31] := DateText(VendorEntry."Closed at Date");
        if InvoiceLine.Type = InvoiceLine.Type::"G/L Account" then begin
            Values[45] := InvoiceLine."No.";
            if GLAccount.Get(InvoiceLine."No.") then
                Values[46] := GLAccount.Name;
        end;
        if JobTask.Get(InvoiceLine."Job No.", InvoiceLine."Job Task No.") then
            Values[49] := JobTask.Description;
    end;

    local procedure SetCostAccountFromDimensions()
    begin
        SetDimensionValues(GLSetup."Global Dimension 1 Code", 41, 42);
        SetDimensionValues(GLSetup."Global Dimension 2 Code", 43, 44);
    end;

    local procedure SetDimensionValues(DimensionCode: Code[20]; CodeColumn: Integer; NameColumn: Integer)
    var
        DimensionSetEntry: Record "Dimension Set Entry";
        DimensionValue: Record "Dimension Value";
    begin
        if DimensionCode = '' then
            exit;
        if not DimensionSetEntry.Get(InvoiceLine."Dimension Set ID", DimensionCode) then
            exit;

        Values[CodeColumn] := DimensionSetEntry."Dimension Value Code";
        if DimensionValue.Get(DimensionCode, DimensionSetEntry."Dimension Value Code") then
            Values[NameColumn] := DimensionValue.Name;
    end;

    local procedure GetMaterialType(): Text
    var
        IVLTrans: Record "KVS IVL Translation Table";
        ProdBOMHeader: Record "Production BOM Header";
        MaterialType: Text;
    begin
        case Item."KVSTEX Item Type" of
            Item."KVSTEX Item Type"::"Finished Product",
            Item."KVSTEX Item Type"::"KVS Cutset",
            Item."KVSTEX Item Type"::"KVS Colour Ribbon":
                MaterialType := 'finished goods';
            else begin
                if ProdBOMHeader.Get(Item."Production BOM No.") then
                    MaterialType := 'Semi Finished Goods'
                else
                    MaterialType := 'Raw Material';

                IVLTrans.SetRange("Object ID", 27);
                IVLTrans.SetRange("Object Type", IVLTrans."Object Type"::Table);
                IVLTrans.SetRange(ID, '09_MAT_TYP');
                IVLTrans.SetRange("Field Value", Item."No.");
                IVLTrans.SetFilter(Translation, '<>%1', '');
                if IVLTrans.FindFirst() then
                    MaterialType := IVLTrans.Translation;
            end;
        end;
        exit(MaterialType);
    end;

    local procedure GetMaterialCategory(): Text
    var
        IVLTrans: Record "KVS IVL Translation Table";
    begin
        IVLTrans.SetRange("Object ID", 5722);
        IVLTrans.SetRange("Object Type", IVLTrans."Object Type"::Table);
        IVLTrans.SetRange(ID, '09_MATDIM_PROD_TYP1');
        IVLTrans.SetRange("Field Value", Item."Item Category Code");
        if IVLTrans.FindFirst() then
            if IVLTrans.Translation <> '' then
                exit(IVLTrans.Translation);
        exit('Flat Fabric');
    end;

    local procedure DateText(Value: Date): Text
    begin
        if Value = 0D then
            exit('');
        exit(Format(Value, 0, '<Year4>/<Month,2>/<Day,2>'));
    end;

    local procedure SaveBuffer()
    var
        BufferRef: RecordRef;
        BufferField: FieldRef;
        ColumnNo: Integer;
        FieldIndex: Integer;
    begin
        Buffer.Init();
        Buffer."Entry No." := Buffer.getNextEntry();
        Buffer."Export Date" := CurrentDateTime();
        Buffer."Export Batch ID" := 'UTT O9 Purchase Invoice';
        BufferRef.GetTable(Buffer);
        for ColumnNo := 1 to ArrayLen(Values) do
            for FieldIndex := 1 to BufferRef.FieldCount do begin
                BufferField := BufferRef.FieldIndex(FieldIndex);
                if BufferField.Name = StrSubstNo('Field %1', ColumnNo) then
                    BufferField.Value := CopyStr(Values[ColumnNo], 1, BufferField.Length);
            end;
        BufferRef.Insert();
        BufferRef.Close();
    end;

    var
        Values: array[49] of Text;
        StartDate: Date;
        EndDate: Date;
        InvoiceHeader: Record "Purch. Inv. Header";
        Vendor: Record Vendor;
        Item: Record Item;
        PurchaseLine: Record "Purchase Line";
        CompanyInfo: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        ExchangeRate: Record "Currency Exchange Rate";
        VendorEntry: Record "Vendor Ledger Entry";
        GLAccount: Record "G/L Account";
        JobTask: Record "Job Task";
        Buffer: Record "UTT IBPO9 Buffer";
}
