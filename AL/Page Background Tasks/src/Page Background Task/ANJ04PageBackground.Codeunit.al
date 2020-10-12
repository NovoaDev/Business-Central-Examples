codeunit 50100 "ANJ04 Page Background"
{
    trigger OnRun()
    var
        ANJEmailValidator: Codeunit "ANJ04 EmailValidator";
        Result: Dictionary of [Text, Text];
        EmailToVerify: Text;
        ResultApiWS: text;
    begin
        EmailToVerify := Page.GetBackgroundParameters().Get('EmailToVerify');

        Sleep(1000);
        ResultApiWS := ANJEmailValidator.ValidateEmailAddress(EmailToVerify);
        Result.Add('WSResponse', ResultApiWS);

        Page.SetBackgroundTaskResult(Result);
    end;
}