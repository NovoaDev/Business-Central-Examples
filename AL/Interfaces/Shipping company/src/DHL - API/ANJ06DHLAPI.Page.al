page 50200 "ANJ06 DHL API"
{
    PageType = API;
    APIPublisher = 'anj';
    APIGroup = 'courier';
    APIVersion = 'beta';
    EntityName = 'dhl';
    EntitySetName = 'dhl';
    SourceTable = "ANJ06 shipping package";
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    SourceTableView = order(ascending) where(Company = const(DHL));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                }
                field(customer; Rec.Customer)
                {
                }
                field(trackingno; Rec."Tranking Number")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Company := Rec.Company::DHL;
    end;
}