page 50201 "ANJ06 GSL WS"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "ANJ06 shipping package";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTableView = order(ascending) where(Company = const(GLS));

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(customer; Rec.Customer)
                {
                    ApplicationArea = All;
                }

                field(trackingno; Rec."Tranking Number")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Company := Rec.Company::GLS;
    end;
}