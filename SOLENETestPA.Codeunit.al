codeunit 84602 SOL_ENE_TestPA
{
    //outgoing
    [ExternalBusinessEvent('OutlookStatusChange', 'OutlookStatusChange', 'Business event connector for PowerAutomate flow to change status in Outlook', EventCategory::SOL_ENE_Outlook, '1.0')]
    local procedure OutlookStatusChange(RowID: Guid; OutlookID: Text[250]; Name: Text[100]; OperationType: Enum SOLENE_OperationType)
    begin
    end;

    [EventSubscriber(ObjectType::Page, Page::SOLENE_OutlookEntry, SOLENEOnAfterActionPAChangeStatus, '', false, false)]
    local procedure SOLENE_OutlookEntry_SOLENEOnAfterActionPAChangeStatus(RowID: Guid; OutlookID: Text[250]; Name: Text[100]; OperationType: Enum SOLENE_OperationType)
    begin
        OutlookStatusChange(RowID, OutlookID, Name, OperationType);
    end;

    [EventSubscriber(ObjectType::Table, Database::SOLENE_OutlookEntry, OnAfterModifyOutlookEntry, '', false, false)]
    local procedure SOLENE_OutlookEntry_OnAfterModifyOutlookEntry(RowID: Guid; OutlookID: Text[250]; Name: Text[100]; OperationType: Enum SOLENE_OperationType)
    begin
        OutlookStatusChange(RowID, OutlookID, Name, OperationType);
    end;


    //incoming
    procedure UpdateOutlookEntry(KeyOutlookID: Text[250]; NewName: Text[100]; NewOperationType: Enum SOLENE_OperationType)
    var
        OutlookEntry: Record SOLENE_OutlookEntry;
    begin
        OutlookEntry.SetRange("Outlook ID", KeyOutlookID);
        if not OutlookEntry.FindFirst() then
            Error('') // fallback for PowerAutomate can be implemented - not found
        else begin
            OutlookEntry.Validate(Name, NewName);
            OutlookEntry.Validate("Operation Type", NewOperationType);
            OutlookEntry.Modify();
        end;
    end;

    procedure CreateOutlookEntry(NewOutlookID: Text[250]; NewName: Text[100]; NewOperationType: Enum SOLENE_OperationType)
    var
        OutlookEntry: Record SOLENE_OutlookEntry;
    begin
        OutlookEntry.Validate("Outlook ID", NewOutlookID);
        if not OutlookEntry.Insert(true) then
            Error(''); // fallback for PowerAutomate can be implemented - cannot be inserted

        OutlookEntry.Validate(Name, NewName);
        OutlookEntry.Validate("Operation Type", NewOperationType);
        OutlookEntry.Modify();
    end;

}