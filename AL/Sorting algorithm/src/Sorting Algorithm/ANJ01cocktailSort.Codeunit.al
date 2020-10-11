codeunit 50102 "ANJ01 cocktail Sort"
{
    procedure sort(var arry: array[10] of Decimal)
    begin
        cocktailSort(arry);
    end;

    local procedure cocktailSort(var arry: array[10] of Decimal)
    var
        hasChanged: Boolean;
        i: Integer;
    begin
        repeat
            hasChanged := false;
            for i := 1 to ArrayLen(arry) - 1 do
                if (arry[i] > arry[i + 1]) then begin
                    swap(arry, i, i + 1);
                    hasChanged := true;
                end;

            if NOT hasChanged then break;

            for i := ArrayLen(arry) - 1 DOWNTO 1 do
                if (arry[i] > arry[i + 1]) then begin
                    swap(arry, i, i + 1);
                    hasChanged := true;
                end;
        until hasChanged;
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