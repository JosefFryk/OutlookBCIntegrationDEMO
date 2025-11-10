page 84601 SOLENE_APIOutlookEntry
{
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'seyfor';
    APIVersion = 'v2.0';
    Caption = 'Outlook Entry';
    EntityName = 'outlookEntry';
    EntitySetName = 'outlookEntries';
    SourceTable = SOLENE_OutlookEntry;
    DelayedInsert = true;
    ModifyAllowed = true;
    InsertAllowed = true;
    ODataKeyFields = SystemId;



    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'ID';
                    Editable = false;
                }
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(outlookId; Rec."Outlook ID")
                {
                    Caption = 'Outlook ID';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(operationType; Rec."Operation Type")
                {
                    Caption = 'Operation Type';
                }
            }
        }
    }

    [ServiceEnabled]
    procedure createOutlookEntry(NewOutlookID: Text[250]; NewName: Text[100]; NewOperationType: Enum SOLENE_OperationType)
    var
        TestPA: Codeunit SOL_ENE_TestPA;
    begin
        TestPA.CreateOutlookEntry(NewOutlookID, NewName, NewOperationType);
    end;

    [ServiceEnabled]
    procedure updateOutlookEntry(KeyOutlookID: Text[250]; NewName: Text[100]; NewOperationType: Enum SOLENE_OperationType)
    var
        TestPA: Codeunit SOL_ENE_TestPA;
    begin
        TestPA.UpdateOutlookEntry(KeyOutlookID, NewName, NewOperationType);
    end;

    [ServiceEnabled]
    procedure deleteOutlookEntry(NewOutlookID: Text[250])
    var
        TestPA: Codeunit SOL_ENE_TestPA;
    begin

    end;
}