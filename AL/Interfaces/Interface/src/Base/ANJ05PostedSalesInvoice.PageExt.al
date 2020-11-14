pageextension 50101 "ANJ05 Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("ANJ05 Shipping Agent"; Rec."ANJ05 Shipping Agent")
            {
                ApplicationArea = All;
                ToolTip = 'Shipping Agent', comment = 'ESP="Agente de envio"';
                Editable = false; //Descomentar para test
            }
            field("ANJ05 Tracking Number"; Rec."ANJ05 Tracking Number")
            {
                ApplicationArea = All;
                ToolTip = 'Tracking Number"', comment = 'ESP="Número de seguimiento"';
                Editable = false;
            }
        }
    }
    actions
    {
        addlast(processing)
        {
            action("ANJ05 Test WS")
            {
                ApplicationArea = All; //Test

                ToolTip = 'test', comment = 'ESP="test"';

                trigger OnAction()
                var
                    ANJCallWS: Codeunit "ANJ05 CallWebservice";
                begin
                    ANJCallWS.CallWebServices(Rec."No.");
                end;
            }
        }
    }
}