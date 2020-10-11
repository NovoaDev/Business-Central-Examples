#pragma implicitwith disable
page 50100 "ANJ02 Cust. Manual VAT Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    Caption = 'Customer Manual VAT Registration No. Setup', comment = 'ESP="Configuración manual del CIF/NIF Cliente"';

    layout
    {
        area(Content)
        {
            repeater(Repat)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer No.', comment = 'ESP="Nº Cliente"';
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Name', comment = 'ESP="Nombre Cliente"';
                    Editable = false;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer VAT Registration No.', comment = 'ESP="CIF/NIF Cliente"';
                }
            }
        }
    }
}
#pragma implicitwith restore