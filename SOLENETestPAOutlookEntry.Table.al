table 84601 SOLENE_OutlookEntry
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Outlook ID"; Text[250])
        {
            Caption = 'Outlook';
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(4; "Operation Type"; Enum SOLENE_OperationType)
        {
            Caption = 'Operation Type';
        }
    }

    keys
    {
        key(PK; "entry No.")
        {
            Clustered = true;
        }
        key(PAKey; "Outlook ID")
        {
            Unique = true;
        }
    }


    [IntegrationEvent(false, false)]
    local procedure OnAfterModifyOutlookEntry(RowID: Guid; OutlookID: Text[250]; Name: Text[100]; OperationType: Enum SOLENE_OperationType)
    begin
    end;
}