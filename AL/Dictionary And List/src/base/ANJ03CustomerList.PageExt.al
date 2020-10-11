pageextension 50100 "ANJ03 Customer List" extends "Customer List"
{
    layout
    {
        addfirst(factboxes)
        {
            part("ANJ03 Cust. Inc. Bal."; "ANJ03 Cust. Inc. Bal. Faxbox")
            {
                ApplicationArea = ALL;
            }
        }
    }

    actions
    {
        addfirst(processing)
        {
            action(ANJ03AddToDiccionario)
            {
                Caption = 'Add 5% increase to customer', comment = 'ESP="Agregar incremento de 5% al cliente"';
                ToolTip = 'Action to add 5% increase to customer', comment = 'ESP="Accion para Agregar incremento de 5% al cliente"';

                ApplicationArea = All;
                Image = Addresses;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    AmmoutTemp: Decimal;
                    AddTemp: Integer;
                    BalanceErr: Label 'Cant add increment to a customer without debt', comment = 'ESP="No se puede agregar incremento a un cliente sin deuda"';
                begin
                    //Dictionary
                    Rec.CalcFields("Balance (LCY)");
                    if Rec."Balance (LCY)" = 0 then
                        Error(BalanceErr);

                    AmmoutTemp := CustomerAcc.get(Rec."No.");
                    AmmoutTemp += AmmoutTemp * 0.05;

                    CustomerAcc.Set(Rec."No.", AmmoutTemp);

                    AddTemp := CustomerAdd.get(Rec."No.");
                    CustomerAdd.Set(Rec."No.", AddTemp + 1);

                    //List
                    if not customerNames.Contains(Rec.Name) then
                        customerNames.Add(Rec.Name);
                end;
            }
            action(ANJ03ShowCustomerWithIncrement)
            {
                Caption = 'Show customer list with increment', comment = 'ESP="Mostrar lista de clientes con incremento"';
                ToolTip = 'Action show customer list with increment', comment = 'ESP="Accion mostrar lista de clientes con incremento';

                ApplicationArea = All;
                Image = List;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    MessageTextBuilder: TextBuilder;
                    i: Integer;
                begin
                    for i := 1 to customerNames.Count() do
                        MessageTextBuilder.AppendLine(customerNames.Get(i));

                    Message(MessageTextBuilder.ToText());
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        FillParameters();
    end;

    local procedure FillParameters()
    var
        PaymentTerms: Record "Payment Terms";
        Parameters: Dictionary of [text, Text];
        IncrementBalance: Decimal;
        increment: Integer;
    begin
        Parameters.Add('Name', Rec.Name);

        if PaymentTerms.Get(Rec."Payment Terms Code") then
            Parameters.Add('PaymentTerms', PaymentTerms.Description)
        else
            Parameters.Add('PaymentTerms', '');

        Rec.CalcFields("Balance (LCY)");
        Parameters.Add('OriginalBalance', Format(Rec."Balance (LCY)"));

        if not CustomerAcc.ContainsKey(Rec."No.") then begin
            CustomerAcc.Add(Rec."No.", Rec."Balance (LCY)");
            CustomerAdd.Add(Rec."No.", 0);
        end;

        IncrementBalance := CustomerAcc.Get(Rec."No.");
        if IncrementBalance <> Rec."Balance (LCY)" then
            Parameters.Add('IncrementBalance', Format(ROUND(IncrementBalance, 0.2)))
        else
            Parameters.Add('IncrementBalance', '0');

        increment := CustomerAdd.Get(Rec."No.");
        Parameters.Add('Increment', Format(increment));

        CurrPage."ANJ03 Cust. Inc. Bal.".Page.RefreshFactbox(Parameters);
    end;

    var
        CustomerAcc: Dictionary of [Code[20], Decimal];
        CustomerAdd: Dictionary of [Code[20], Integer];
        customerNames: List of [Text];
}