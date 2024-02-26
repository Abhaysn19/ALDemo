table 50102 Citizens
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; NationalityCode; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Age; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Employed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; NationalityCode, Name)
        {
            Clustered = true;
        }
    }

    trigger OnModify()
    begin
        Message('A record has been modified')
    end;


}