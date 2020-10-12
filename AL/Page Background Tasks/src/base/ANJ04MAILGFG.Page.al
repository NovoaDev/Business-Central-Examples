page 50100 "ANJ04 MAIL GFG"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(ApiKey)
            {
                Caption = 'Api Key', comment = 'ESP="Api Key"';
                field(ANJ04Password; ANJ04Password)
                {
                    ApplicationArea = All;
                    Caption = 'Api Key', comment = 'ESP="Api Key"';
                    ToolTip = 'Api Key', comment = 'ESP="Api Key"';

                    trigger OnValidate()
                    begin
                        if IsolatedStorage.Contains('MailApiKey', DataScope::Company) then
                            IsolatedStorage.Delete('MailApiKey', DataScope::Company);

                        IsolatedStorage.Set('MailApiKey', ANJ04Password, DataScope::Company);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if IsolatedStorage.Get('MailApiKey', DataScope::Company, ANJ04Password) then;
    end;

    var
        ANJ04Password: text[250];
}