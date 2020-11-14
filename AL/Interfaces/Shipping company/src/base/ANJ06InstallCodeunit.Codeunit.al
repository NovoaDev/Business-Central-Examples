codeunit 50202 "ANJ06 Install Codeunit"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        PublishWSGLSPage();
        PublishCodeunitMRW();
    end;

    local procedure PublishWSGLSPage()
    begin
        if not TenantWebService.Get(ObjectType::Page, 'GLSWS') then begin
            Clear(TenantWebService);
            TenantWebService.Init();
            TenantWebService."Object Type" := TenantWebService."Object Type"::Page;
            TenantWebService."Object ID" := Page::"ANJ06 GSL WS";
            TenantWebService."Service Name" := 'GLSWS';
            TenantWebService.Published := true;
            TenantWebService.Insert(true);
        end;
    end;

    local procedure PublishCodeunitMRW()
    begin
        if not TenantWebService.Get(ObjectType::Codeunit, 'MWROutboundAction') then begin
            TenantWebService.Init();
            TenantWebService."Object Type" := TenantWebService."Object Type"::Codeunit;
            TenantWebService."Object ID" := Codeunit::"ANJ06 MRW OutBoundAction";
            TenantWebService."Service Name" := 'MWROutboundAction';
            TenantWebService.Published := true;
            TenantWebService.Insert(true);
        end;
    end;

    var
        TenantWebService: Record "Tenant Web Service";
}