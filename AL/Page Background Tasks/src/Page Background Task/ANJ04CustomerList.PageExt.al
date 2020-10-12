pageextension 50100 "ANJ04 Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {

            field(ANJ04EmailToVerify; ANJ04EmailToVerify)
            {
                ApplicationArea = All;
                Caption = 'Email to verify', comment = 'ESP="Correo electrónico para verificar"';
                ToolTip = 'Email to verify', comment = 'ESP="Correo electrónico para verificar"';
                Editable = false;
                StyleExpr = StyleExpr;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        TaskParameters: Dictionary of [Text, Text];
        CustWithoutEmailLbl: Label 'EL cliente no tiene correo electrónico', comment = 'ESP="Customer does not have an email address"';
    begin
        StyleExpr := 'Standard';
        If rec."E-Mail" = '' then begin
            ANJ04EmailToVerify := CustWithoutEmailLbl;
            StyleExpr := 'Attention';
            exit;
        end;

        ANJ04EmailToVerify := 'Loading...';
        TaskParameters.Add('EmailToVerify', Rec."E-Mail");
        CurrPage.EnqueueBackgroundTask(GTaskId1, Codeunit::"ANJ04 Page Background", TaskParameters, 20000, PageBackgroundTaskErrorLevel::Warning);
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
        if (TaskId = GTaskId1) then begin
            ANJ04EmailToVerify := Results.Get('WSResponse');
            StyleExpr := 'Favorable';
            CurrPage.Update();
        end;
    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    var
        PBTErrorNotification: Notification;
        ChildSessionTaskTimeoutLbl: Label 'Something went wrong. The start and finish times havent been updated.', comment = 'ESP="Algo salió mal. Los tiempos de inicio y fin no han sido actualizados."';
        ChildSessionsTaskTimeoutLbl: Label 'It took too long to get results. Try again.', comment = 'ESP="Tomó mucho tiempo obtener resultados. Inténtelo de nuevo."';
    begin
        if (ErrorCode = 'ChildSessionTaskTimeout') then begin
            IsHandled := true;
            PBTErrorNotification.Message(ChildSessionTaskTimeoutLbl);
            PBTErrorNotification.Send();
        end
        else
            if (ErrorText = 'Child Session task was terminated because of a timeout.') then begin
                IsHandled := true;
                PBTErrorNotification.Message(ChildSessionsTaskTimeoutLbl);
                PBTErrorNotification.Send();
            end
    end;

    var
        GTaskId1: Integer;
        ANJ04EmailToVerify: Text;
        StyleExpr: Text;
}