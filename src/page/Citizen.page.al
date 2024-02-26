page 50102 Citizens
{
    Caption = 'Citizens';
    PageType = ListPart; //it is a list page but it can be a part of other page
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Citizens;

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
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                }
                field(Employed; Rec.Employed)
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}