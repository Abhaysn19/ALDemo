page 50100 Nationality
{
    Caption = 'Nationality';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Nationality;
    CardPageId = NationalityCard;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(NationalityCode; Rec.NationalityCode)
                {
                    ApplicationArea = All;
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = All;
                }
                field(Population; Rec.Population)
                {
                    ApplicationArea = All;
                    // Editable = false;
                }
                field(DualCitizenship; Rec.DualCitizenship)
                {
                    ApplicationArea = All;
                }
                field(NationalityType; Rec.NationalityType)
                {
                    ApplicationArea = All;
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(GiveMessage)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Toggle();
                    Message('This has a button which does nothing');
                end;
            }
            action(ToggleDualCitizenShip)
            {
                Promoted = true;
                Image = Save;
                Caption = 'Toggle Dual CitizenShip';
                ToolTip = 'This button is going to toggle the dual citizenship of the record';
                ApplicationArea = All;

                trigger OnAction();
                var
                    Citizens: Record Citizens;
                begin
                    Citizens.SetRange(NationalityCode, Rec.NationalityCode);
                    OnBeforeToggleCitizenship(Citizens);
                    Toggle();
                    OnAfterToggleCitizenship(Citizens);
                end;
            }
        }
    }

    procedure Toggle()
    var
        MessageHandling: Codeunit MessageHandling;
    begin
        if Rec.DualCitizenship then
            Rec.DualCitizenship := false
        else
            Rec.DualCitizenship := true;
        Rec.Modify(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeToggleCitizenship(var Citizens: Record Citizens)
    begin

    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterToggleCitizenship(var Citizens: Record Citizens)
    begin

    end;

    trigger OnAfterGetRecord()
    var
        Citizens: Record Citizens;

    begin
        Citizens.SetRange(NationalityCode, Rec.NationalityCode);
        Rec.Population := Citizens.Count();
        Rec.Modify();
    end;


}
