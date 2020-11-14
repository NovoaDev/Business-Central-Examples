page 50202 "ANJ06 shipping package"
{

    ApplicationArea = All;
    Caption = 'shipping package';
    PageType = List;
    SourceTable = "ANJ06 shipping package";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Company; Rec.Company)
                {
                    ApplicationArea = All;
                    ToolTip = 'Company';
                }
                field(Customer; Rec.Customer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Name';
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Address';
                }
                field("Tranking Number"; Rec."Tranking Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Tranking Number';
                }
            }
        }
    }

}
