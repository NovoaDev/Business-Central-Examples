table 50200 "ANJ06 shipping package"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Entry; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; Company; Enum "ANJ06 Company")
        {
            DataClassification = CustomerContent;
        }
        field(3; Customer; code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(4; "Customer Name"; text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field(Customer)));
        }
        field(5; "Customer Address"; text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Address where("No." = field(Customer)));
        }
        field(6; "Tranking Number"; text[100])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Entry)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        ANJ06ShippingManagement: Codeunit "ANJ06 Shipping Management";
    begin
        UpdateRecEntry();
        ANJ06ShippingManagement.GenerateTrankingNumber(Rec);
    end;

    local procedure UpdateRecEntry()
    begin
        if not NumberSequence.Exists('shippingPackage', true) then
            NumberSequence.Insert('shippingPackage', 1000, 1000, true);

        Rec.Entry := NumberSequence.Next('shippingPackage', true);
    end;
}