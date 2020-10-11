codeunit 50103 "ANJ01 Insertion Sort"
{
    procedure sort(var arry: array[10] of Decimal)
    begin
        InsertionSort(arry);
    end;

    local procedure InsertionSort(var arry: array[10] of Decimal)
    var
        i: Integer;
        iTemp: Integer;
        currentVal: Decimal;
        mustGoOut: Boolean;
    begin
        for i := 2 to ArrayLen(arry) do begin
            currentVal := arry[i];
            iTemp := i - 1;
            mustGoOut := false;

            while NOT mustGoOut do
                if iTemp > 0 then begin
                    if arry[iTemp] > currentVal then begin
                        arry[iTemp + 1] := arry[iTemp];
                        iTemp -= 1;
                    end else
                        mustGoOut := true;
                end else
                    mustGoOut := true;

            arry[iTemp + 1] := currentVal;
        end;
    end;
}

