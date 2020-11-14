codeunit 50103 "ANJ05 GLS Management" implements "ANJ05 shipping company"
{
    procedure GetEndPoint(): Text

    begin
        exit('http://shippingapi:7048/BC/ODataV4/Company(''CRONUS%20Espa%C3%B1a%20S.A.'')/GLSWS');
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