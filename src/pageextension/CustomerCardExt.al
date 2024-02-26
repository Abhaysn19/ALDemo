pageextension 50000 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field(Nationality; Rec.Nationality)
            {
                Caption = 'Nationality';
            }
        }
        addafter(General)
        {
            field(Number; Rec.Number)
            {
                Caption = 'Number';
            }
        }

        addafter("No.")
        {
            field(Amount; Rec.Amount)
            {
                Caption = 'Amount';
            }
        }
        addafter(Amount)
        {
            field(myText; Rec.myText)
            {
                Caption = 'MyText';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter(Templates)
        {
            action(MyMessage)
            {
                Caption = 'MyMessage';
                Visible = True;
                Image = MailSetup;
                trigger OnAction()
                var
                    a: Integer;
                    b: Integer;
                begin
                    Message('MyMessage Action Clicked');
                    a := 10;
                    a := 20;
                    b := 30;
                    Message('%1, %2', a, b);
                end;
            }

            action(DisplayText)
            {
                Caption = 'DisplayText';
                Visible = True;
                Image = MailSetup;
                trigger OnAction()
                var
                    MyText: Text;
                begin
                    Message('Message is Displayed');
                    MyText := 'Hello';
                    Message('%1', MyText);
                end;
            }
            action(DisplayNationality)
            {
                Caption = 'DisplayNationality';
                Visible = True;
                trigger OnAction()
                var
                    NationalityTable: Record Nationality;
                begin
                    NationalityTable.SetRange(NationalityCode, Rec.Nationality);
                    if NationalityTable.FindFirst() then
                        Message('%1', NationalityTable.Nationality)
                    else
                        Message('There is no records selected/records in the nationality table with this filter');

                end;
            }
            action(DisplayAllNationality)
            {
                Caption = 'Display All Nationality';
                Visible = true;

                trigger OnAction()
                var
                    NationalityTable: Record Nationality;
                begin
                    NationalityTable.FindFirst();
                    repeat
                        Message('%1', NationalityTable.Nationality);
                    until NationalityTable.Next() = 0;
                end;
            }
        }

    }

    var
        myInt: Integer;
}