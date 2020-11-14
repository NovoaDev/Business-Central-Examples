tableextension 50100 "ANJ05 Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "ANJ05 Shipping Agent"; Enum "ANJ05 Company")
        {
            DataClassification = CustomerContent;
            Caption = 'Shipping Agent', comment = 'ESP="Agente de envio"';
        }
        field(50101; "ANJ05 Tracking Number"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Tracking Number"', comment = 'ESP="Número de seguimiento"';
        }
    }
    procedure "ANJ05 Populate"(JsonText: Text): Boolean
    var
        JsonObj: JsonObject;
        JToken: JsonToken;
        TempTrackingNumber: Text;
        JsonTokenNotFoundErr: Label 'Could not find JsonToken %1', Comment = 'ESP="No puedo encontrar JsonToken %1"';
        JsonTokenIsNotValueErr: Label 'The Json object is malformed. Could not find Json value %1',
                                    Comment = 'ESP="El objeto Json está mal formado. No puedo encontrar el valor Json %1"';
    begin
        JsonObj.ReadFrom(JsonText);
        if not JsonObj.Get('trackingno', JToken) then
            if not JsonObj.Get('value', JToken) then
                Error(JsonTokenNotFoundErr, 'trackingno');

        if not JToken.IsValue() then
            Error(JsonTokenIsNotValueErr, 'trackingno');

        TempTrackingNumber := Format(JToken.AsValue());
        TempTrackingNumber := CopyStr(TempTrackingNumber, 2, StrLen(TempTrackingNumber) - 2);
        Rec."ANJ05 Tracking Number" := CopyStr(TempTrackingNumber, 1, 100);
        exit(Rec."ANJ05 Tracking Number" <> '');
    end;
}