tableextension 50000 "Customer Table Extension" extends Customer

{
    fields
    {
        field(50000; Nationality; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Nationality.NationalityCode;
        }
        field(50001; Number; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; myText; Text[100])
        {
            Description = 'MyText';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}