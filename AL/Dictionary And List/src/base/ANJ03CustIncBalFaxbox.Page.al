page 50100 "ANJ03 Cust. Inc. Bal. Faxbox"
{
    Caption = 'Add 5% increase to customer', comment = 'ESP="Agregar incremento de 5% al cliente"';
    PageType = CardPart;

    layout
    {
        area(Content)
        {
            field(Name; CustName)
            {
                ShowCaption = false;
                ApplicationArea = All;
            }
            field(CustPaymentTerms; CustPaymentTerms)
            {
                ApplicationArea = All;
                Caption = 'Payment Terms', comment = 'ESP="Condiciones de pago"';
            }
            field(CustOriginalBalance; CustOriginalBalance)
            {
                ApplicationArea = All;
                Caption = 'Original Balance', comment = 'ESP="Saldo original"';
            }
            field(CustIncrementBalance; CustIncrementBalance)
            {
                ApplicationArea = All;
                Caption = 'Balance with increments', comment = 'ESP="Saldo con incrementos"';
            }
            field(CustIncrement; CustIncrement)
            {
                ApplicationArea = All;
                Caption = 'Number of increments', comment = 'ESP="Numero de incrementos"';
            }
        }
    }
    procedure RefreshFactbox(Parameters: Dictionary of [text, Text])
    begin
        CustName := Parameters.Get('Name');
        CustPaymentTerms := Parameters.Get('PaymentTerms');
        CustOriginalBalance := Parameters.Get('OriginalBalance');
        CustIncrementBalance := Parameters.Get('IncrementBalance');
        CustIncrement := Parameters.Get('Increment');
        CurrPage.Update();
    end;

    var
        CustName: Text;
        CustPaymentTerms: text;
        CustOriginalBalance: text;
        CustIncrementBalance: Text;
        CustIncrement: Text;
}