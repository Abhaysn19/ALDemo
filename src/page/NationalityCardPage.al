page 50101 NationalityCard
{
    PageType = Card;
    SourceTable = Nationality;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(NationalityCode; Rec.NationalityCode)
                {
                    ApplicationArea = All; // visible to everyone

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

            group(Citizens)
            {
                part(Citizen; Citizens)
                {
                    ApplicationArea = All;
                    SubPageLink = NationalityCode = field(NationalityCode);
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }


}