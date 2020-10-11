codeunit 50100 "ANJ01 Sorting Algorithm"
{
    procedure Sort(var arry: array[10] of Decimal; algo: Enum "ANJ01 Algorithm type")
    var
        ANJ01bubbleSort: Codeunit "ANJ01 bubble Sort";
        ANJ01cocktailSort: Codeunit "ANJ01 cocktail Sort";
        ANJ01InsertionSort: Codeunit "ANJ01 Insertion Sort";
        ANJ01quickSort: Codeunit "ANJ01 quick Sort";
    begin
        case algo of
            algo::bubbleSort:
                ANJ01bubbleSort.sort(arry);
            algo::cocktailSort:
                ANJ01cocktailSort.sort(arry);
            algo::insertionSort:
                ANJ01InsertionSort.sort(arry);
            algo::quickShort:
                ANJ01quickSort.sort(arry);
        end;
    end;

    procedure ShowResult(arry: array[10] of Decimal)
    var
        MessageTextBuilder: TextBuilder;
        i: Integer;
        MainMsgLbl: Label 'The quantities sorted would be as follows:', comment = 'ESP="Las cantidades ordenadas serian la siguientes:"';
    begin
        MessageTextBuilder.AppendLine(MainMsgLbl);
        MessageTextBuilder.AppendLine('');

        for i := 1 to Arraylen(arry) do
            if arry[i] > 0 then
                MessageTextBuilder.AppendLine(Format(arry[i]));

        Message(MessageTextBuilder.ToText());
    end;
}