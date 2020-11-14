codeunit 50100 "ANJ05 DHL Management" implements "ANJ05 shipping company"
{
    procedure GetEndPoint(): Text

    begin
        exit('http://shippingapi:7048/BC/api/anj/courier/beta/companies(0b0e78c8-b1fd-ea11-bb71-000d3a492075)/dhl');
    end;

    procedure GetBodyData(CustNo: code[20]): Text
    begin
        exit('{ "customer": "' + CustNo + '" }');
    end;

    procedure GetWSKey(): Text
    begin
        exit('1Wx9w0iE+OOMzmmlvAnVfRJ9IxJeHwAHVco1zTs6FjE=');
    end;

    procedure GetUser(): Text
    begin
        exit('USER');
    end;
}