enum 50100 "ANJ01 Algorithm type"
{
    Extensible = true;
    Caption = 'Algorithm', comment = 'ESP="Algoritmo"';

    value(0; bubbleSort)
    {
        Caption = 'Bubble Sort', comment = 'ESP="Burbuja"';
    }
    value(1; cocktailSort)
    {
        Caption = 'Cocktail Sort', comment = 'ESP="Cóctel"';
    }
    value(2; insertionSort)
    {
        Caption = 'Insertion Sort', comment = 'ESP="Inserción"';
    }
    value(3; quickShort)
    {
        Caption = 'Quick Short', comment = 'ESP="Quick Short"';
    }
}