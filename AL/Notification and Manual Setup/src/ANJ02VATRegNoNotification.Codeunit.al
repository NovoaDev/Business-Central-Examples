codeunit 50100 "ANJ02 VAT Reg. No Notification"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Conf./Personalization Mgt.", 'OnRoleCenterOpen', '', false, false)]
    local procedure OnRoleCenterOpen();
    begin
        ShowNotifications('ff3b2cb5-2477-4a1f-8da8-83e8fac12d4e');
    end;

    local procedure ShowNotifications(NotificationId: Guid)
    var
        Customer: Record Customer;
        MyNotifications: Record "My Notifications";
        TheNotification: Notification;
        MessageTextLbl: label 'There are customers without a VAT Registration No.!', comment = 'ESP="Existen clientes sin CIF/NIF!"';
        NotificationNameLbl: Label 'VAT Registration No. empty', comment = 'ESP="CIF/NIF vacio"';
        NotificationDescriptionLbl: Label 'Check if VAT Registration No. is empty', comment = 'ESP="Verifica si el campo CIF/NIF se encuentra vacio"';
        Action01Lbl: Label 'Configure customers without VAT Registration No.', comment = 'ESP="Configurar clientes sin CIF/NIF"';
        Action02Lbl: Label 'Disable notification', comment = 'ESP="Desactivar la notificación"';
    begin
        if not MyNotifications.Get(UserId(), NotificationId) then
            MyNotifications.InsertDefault(NotificationId, NotificationNameLbl, NotificationDescriptionLbl, true);

        if not MyNotifications.Enabled then
            exit;

        Customer.SetRange("VAT Registration No.", '');
        if Customer.IsEmpty() then
            exit;

        TheNotification.Id := NotificationId;
        TheNotification.Message := MessageTextLbl;
        TheNotification.Scope := TheNotification.Scope::LocalScope;
        TheNotification.AddAction(Action01Lbl, Codeunit::"ANJ02 VAT Reg. No Notification", 'OpenManualSetupPage');
        TheNotification.AddAction(Action02Lbl, Codeunit::"ANJ02 VAT Reg. No Notification", 'DisableNotification');
        TheNotification.Send();
    end;

    procedure OpenManualSetupPage(TheNotification: Notification)
    var
        Customer: Record Customer;
    begin
        Customer.SetRange("VAT Registration No.", '');
        page.RunModal(Page::"ANJ02 Cust. Manual VAT Setup", Customer);
    end;

    procedure DisableNotification(TheNotification: Notification)
    var
        MyNotifications: Record "My Notifications";
    begin
        if MyNotifications.Get(UserId(), TheNotification.Id) then begin
            MyNotifications.Validate(Enabled, false);
            MyNotifications.Modify();
        end
    end;
}