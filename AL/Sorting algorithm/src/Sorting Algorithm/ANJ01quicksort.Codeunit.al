codeunit 50104 "ANJ01 quick Sort"
{
    procedure sort(var arry: array[10] of Decimal)
    begin
        quickSort(arry, 1, ArrayLen(arry));
    end;

    local procedure quickSort(var arry: array[10] of Decimal; izq: Integer; der: Integer)
    var
        pivot: Decimal;
        i: Integer;
        j: Integer;
    begin
        pivot := arry[izq];
        i := izq;
        j := der;
        while i < j do begin
            while (arry[i] <= pivot) and (i < j) do
                i += 1;
            while arry[j] > pivot do j -= 1;
            if (i < j) then swap(arry, i, j);
        end;

        arry[izq] := arry[j];
        arry[j] := pivot;

        if izq < j - 1 then
            quickSort(arry, izq, j - 1);

        if j + 1 < der then
            quickSort(arry, j + 1, der);
    end;

    local procedure swap(var arry: array[10] of Decimal; i: Integer; j: Integer)
    var
        aux: Decimal;
    begin
        aux := arry[j];
        arry[j] := arry[i];
        arry[i] := aux;
    end;
}