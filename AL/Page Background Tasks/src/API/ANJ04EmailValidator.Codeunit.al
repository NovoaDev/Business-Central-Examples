codeunit 50101 "ANJ04 EmailValidator"
{
    procedure ValidateEmailAddress(EmailToVerify: Text) ResultInfo: Text;
    var
        HttpClient: HttpClient;
        lHttpResponseMessage: HttpResponseMessage;
        JsonToken: JsonToken;
        JsonObject: JsonObject;
        Url: Text;
        JsonText: Text;
        UrlLbl: Label 'https://api.email-validator.net/api/verify?EmailAddress=%1&APIKey=%2', comment = 'ESP="https://api.email-validator.net/api/verify?EmailAddress=%1&APIKey=%2"';
        Error01Err: Label 'Could not reach email validator website.', comment = 'ESP="No pude llegar al sitio web del validador de correo electrónico."';
        Error02Err: Label 'Email validator failed with code %1\%2', comment = 'ESP="El validador de correo electrónico falló con el código. %1\%2"';
    begin
        Url := StrSubstNo(UrlLbl, EmailToVerify, GetApiKey());

        if not HttpClient.Get(Url, lHttpResponseMessage) then
            Error(Error01Err);

        if not lHttpResponseMessage.IsSuccessStatusCode() then
            Error(Error02Err, lHttpResponseMessage.HttpStatusCode(), lHttpResponseMessage.ReasonPhrase());

        lHttpResponseMessage.Content().ReadAs(JsonText);

        JsonObject.ReadFrom(JsonText);
        JsonObject.Get('info', JsonToken);
        ResultInfo := CopyStr(JsonToken.AsValue().AsText(), 1, 2);
    end;

    local procedure GetApiKey(): Text
    var
        ANJ04Password: Text;
    begin
        If IsolatedStorage.Get('MailApiKey', DataScope::Company, ANJ04Password) then
            exit(ANJ04Password);
    end;
}