interface "ANJ05 shipping company"
{
    procedure GetEndPoint(): Text;
    procedure GetBodyData(CustNo: code[20]): Text;
    procedure GetWSKey(): Text
    procedure GetUser(): Text
}