codeunit 50200 "ANJ06 Shipping Management"
{
    procedure GenerateTrankingNumber(var shippingPackage: Record "ANJ06 shipping package")
    var
        Handled: Boolean;
    begin
        OnBeforeGenerateTrankingNumber(shippingPackage, Handled);
        DoGenerateTrankingNumber(shippingPackage, Handled);
        OnAfterGenerateTrankingNumber(shippingPackage);
    end;

    local procedure DoGenerateTrankingNumber(var shippingPackage: Record "ANJ06 shipping package"; Handled: Boolean)
    begin
        if Handled then
            exit;

        shippingPackage."Tranking Number" := CopyStr(Format(shippingPackage.Company) + Format(shippingPackage.Entry), 1, MaxStrLen(shippingPackage."Tranking Number"));
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGenerateTrankingNumber(var shippingPackage: Record "ANJ06 shipping package"; var Handled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGenerateTrankingNumber(var shippingPackage: Record "ANJ06 shipping package");
    begin
    end;
}