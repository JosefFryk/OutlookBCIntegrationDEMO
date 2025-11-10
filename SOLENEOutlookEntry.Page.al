page 84600 SOLENE_OutlookEntry
{
    Caption = 'Outlook Entry';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = SOLENE_OutlookEntry;
    InsertAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {

                }
                field("Outlook ID"; Rec."Outlook ID")
                {

                }
                field(Name; Rec.Name)
                {

                }
                field("Operation Type"; Rec."Operation Type")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            action(SOLENEtestPAStatus)
            {
                ApplicationArea = All;
                Caption = 'Test PA status change';
                Image = TestDatabase;

                trigger OnAction()
                begin
                    SOLENEOnAfterActionPAChangeStatus(Rec.SystemId, Rec."Outlook ID", Rec.Name, Rec."Operation Type");
                end;
            }
            group(testing)
            {
                action(createEntry)
                {
                    ApplicationArea = All;
                    Caption = 'Create Entry';
                    Image = Create;

                    trigger OnAction()
                    var
                        TestPA: Codeunit SOL_ENE_TestPA;
                        OperationType: Enum SOLENE_OperationType;
                    begin
                        TestPA.CreateOutlookEntry('testString', 'testName', OperationType::Create);
                    end;
                }
                action(updateEntry)
                {
                    ApplicationArea = All;
                    Caption = 'Update Entry';
                    Image = UpdateShipment;

                    trigger OnAction()
                    var
                        TestPA: Codeunit SOL_ENE_TestPA;
                        OperationType: Enum SOLENE_OperationType;
                    begin
                        TestPA.UpdateOutlookEntry('testString', 'updatedName', OperationType::Modify);
                    end;
                }
            }
        }

    }

    [IntegrationEvent(false, false)]
    local procedure SOLENEOnAfterActionPAChangeStatus(RowID: Guid; OutlookID: Text[250]; Name: Text[100]; OperationType: Enum SOLENE_OperationType)
    begin
    end;
}

AAMkADQ0MWM5MWEyLWNjNDgtNDk2NC05YjVkLTU4NDVjMjU4NGUxZQBGAAAAAACKLMLb8ct5RI-ODC3yeOfqBwBFxS4klTGZQowJ8_QsluglAAAAAAENAABFxS4klTGZQowJ8_QsluglAAJgMGcdAAA=

AAMkADQ0MWM5MWEyLWNjNDgtNDk2NC05YjVkLTU4NDVjMjU4NGUxZQBGAAAAAACKLMLb8ct5RI-ODC3yeOfqBwBFxS4klTGZQowJ8_QsluglAAAAAAEGAABFxS4klTGZQowJ8_QsluglAAAAAHDnAAA=