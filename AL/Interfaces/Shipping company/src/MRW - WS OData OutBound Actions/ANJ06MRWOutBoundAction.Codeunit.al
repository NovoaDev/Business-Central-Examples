codeunit 50201 "ANJ06 MRW OutBoundAction"
{
    procedure newshipping(custNo: code[20]): text[100]
    var
        ANJ06shippingpackage: record "ANJ06 shipping package";
    begin
        ANJ06shippingpackage.Init();
        ANJ06shippingpackage.Company := ANJ06shippingpackage.Company::MRW;
        ANJ06shippingpackage.Customer := CustNo;
        if ANJ06shippingpackage.Insert(true) then
            exit(ANJ06shippingpackage."Tranking Number");
        exit('Error');
    end;

    procedure getshipments(trankingNumber: Text[100]): Text[2048]
    var
        ANJ06shippingpackage: record "ANJ06 shipping package";
        JsonText: Text[2048];
    begin
        ANJ06shippingpackage.SetRange("Tranking Number", trankingNumber);
        ANJ06shippingpackage.SetRange(Company, ANJ06shippingpackage.Company::MRW);

        if not ANJ06shippingpackage.FindFirst() then
            Error('You have no records');

        JsonText := '{ Customer: ' + ANJ06shippingpackage.Customer + ' , ' +
        'trackingnumber: ' + ANJ06shippingpackage."Tranking Number" + ' }';

        exit(JsonText);
    end;
}