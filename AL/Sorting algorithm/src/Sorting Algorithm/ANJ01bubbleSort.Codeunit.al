codeunit 50101 "ANJ01 bubble Sort"
{
    procedure sort(var arry: array[10] of Decimal)
    begin
        bubbleSort(arry);
    end;

    local procedure bubbleSort(var arry: array[10] of Decimal)
    var
        i: Integer;
        iTemp: Integer;
    begin
        for i := 1 to ArrayLen(arry) - 1 do
            for iTemp := 1 to ArrayLen(arry) - 1 do
                if arry[iTemp] > arry[iTemp + 1] then
                    swap(arry[iTemp], arry[iTemp + 1]);
    end;

    local procedure swap(var Pos: Decimal; var Pos2: Decimal)
    var
        xPos: Decimal;
    begin
        xPos := Pos;
        Pos := Pos2;
        Pos2 := xPos;
    end;
}
