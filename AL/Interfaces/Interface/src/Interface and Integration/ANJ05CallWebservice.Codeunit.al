codeunit 50101 "ANJ05 CallWebservice"
{
    procedure CallWebServices(SalesInvHeaderNo: code[20])
    begin
        doCallWebServices(SalesInvHeaderNo);
    end;

    local procedure doCallWebServices(SalesInvHeaderNo: code[20])
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Base64Convert: codeunit "Base64 Convert";
        HttpClient: HttpClient;
        Headers: HttpHeaders;
        HttpResponseMessage: HttpResponseMessage;
        HttpContent: HttpContent;
        ShippingCompany: Interface "ANJ05 shipping company";
        AuthText: text;
        HttpResponseMessageText: Text;
        AuthLbl: Label '%1:%2', comment = 'ESP="%1:%2"';
        AuthFormulaLbl: Label 'Basic %1', comment = 'ESP="Basic %1"';
        WSErr: Label 'The web service returnet an error message: Status code: %1 Description: %2', comment = 'ESP="El servicio web devuelve un mensaje de error: Código de estado: %1 Descripción: %2"';
    begin
        SalesInvoiceHeader.get(SalesInvHeaderNo);
        ShippingCompany := SalesInvoiceHeader."ANJ05 Shipping Agent";
        HttpContent.WriteFrom(ShippingCompany.GetBodyData(SalesInvoiceHeader."Sell-to Customer No."));
        HttpContent.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'application/json');
        AuthText := StrSubstNo(AuthLbl, ShippingCompany.GetUser(), ShippingCompany.GetWSKey());

        HttpClient.DefaultRequestHeaders().Add('Authorization', StrSubstNo(AuthFormulaLbl, Base64Convert.ToBase64(authtext)));
        HttpClient.DefaultRequestHeaders().Add('If-Match', '*');
        HttpClient.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        HttpClient.Post(ShippingCompany.GetEndPoint(), HttpContent, HttpResponseMessage);
        HttpResponseMessage.Content.ReadAs(HttpResponseMessageText);

        Headers := HttpResponseMessage.Headers();
        if not HttpResponseMessage.IsSuccessStatusCode() then
            Error(WSErr, HttpResponseMessage.HttpStatusCode(), HttpResponseMessageText);

        if SalesInvoiceHeader."ANJ05 Populate"(HttpResponseMessageText) then
            SalesInvoiceHeader.Modify();
    end;
}
