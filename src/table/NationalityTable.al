table 50100 Nationality
{
    DataClassification = ToBeClassified;
    LookupPageId = Nationality;

    fields
    {
        field(1; NationalityCode; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Nationality; Text[50])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Message('%1', NationalityCode);
            end;
        }
        field(3; Population; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count(Citizens where(NationalityCode = field(NationalityCode)));
        }
        field(4; DualCitizenship; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Changed; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; NationalityType; Enum NationalityType)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; NationalityCode)
        {
            Clustered = true;
        }
    }

    trigger OnModify()
    var
        myInt: Integer;
    begin
        Message('The message has been modified');
    end;
}