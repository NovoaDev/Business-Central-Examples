codeunit 50101 "ANJ02 Manual Setup Subs."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Manual Setup", 'OnRegisterManualSetup', '', false, false)]
    local procedure OnRegisterManualSetup(var Sender: Codeunit "Manual Setup");
    var
        ManualSetupCategory: Enum "Manual Setup Category";
        AppInfo: ModuleInfo;
        ManualSetupNameLbl: Label 'Customers without a VAT Registration No.', comment = 'ESP="Clientes sin CIF/NIF."';
        ManualSetupDescriptionLbl: Label 'Configure Customers without a VAT Registration No.', comment = 'ESP="Configurar Clientes sin CIF/NIF."';
        ManualSetupKeywordLbl: Label 'Customers without a VAT Registration No.', comment = 'ESP="Clientes sin CIF/NIF."';
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);

        Sender.Insert(ManualSetupNameLbl,
                      ManualSetupDescriptionLbl,
                      ManualSetupKeywordLbl,
                      Page::"ANJ02 Cust. Manual VAT Setup",
                      AppInfo.Id(),
                      ManualSetupCategory::Sales);
    end;
}