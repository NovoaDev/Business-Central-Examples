pageextension 50100 "ANJ05 Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("ANJ05 Shipping Agent"; Rec."ANJ05 Shipping Agent")
            {
                ApplicationArea = All;
                ToolTip = 'Shipping Agent', comment = 'ESP="Agente de envio"';
            }
        }
    }
}