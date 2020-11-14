tableextension 50101 "ANJ05 Sales Header" extends "Sales Header"
{
    fields
    {
        field(50100; "ANJ05 Shipping Agent"; Enum "ANJ05 Company")
        {
            DataClassification = CustomerContent;
            Caption = 'Shipping Agent', comment = 'ESP="Agente de envio"';
        }
    }
}