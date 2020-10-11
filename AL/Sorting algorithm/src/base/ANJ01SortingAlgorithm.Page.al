page 50100 "ANJ01 Sorting Algorithm"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Exercise - Ordering Algorithm', comment = 'ESP="Ejercicio - Algoritmo de ordenamiento"';

    layout
    {
        area(Content)
        {
            group(Algorithm)
            {
                Caption = 'Algorithm', comment = 'ESP="Algoritmo"';
                field(AlgorithmField; ANJ01Algorithmtype)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    ToolTip = 'Choose a sorting algorithm', comment = 'ESP="Seleccione un algoritmo de ordenamiento"';
                }
            }
            group(Values)
            {
                Caption = 'Values to be ordered', comment = 'ESP="Valores a ordenar"';
                field("Value 1"; ANJ01Arry[1])
                {
                    ApplicationArea = All;
                    Caption = 'Value 1', comment = 'ESP="Valor 1"';
                    ToolTip = 'Value 1 to order', comment = 'ESP="Valor 1 para ordenar"';
                }
                field("Value 2"; ANJ01Arry[2])
                {
                    ApplicationArea = All;
                    Caption = 'Value 2', comment = 'ESP="Valor 2"';
                    ToolTip = 'Value 2 to order', comment = 'ESP="Valor 2 para ordenar"';
                }
                field("Value 3"; ANJ01Arry[3])
                {
                    ApplicationArea = All;
                    Caption = 'Value 3', comment = 'ESP="Valor 3"';
                    ToolTip = 'Value 3 to order', comment = 'ESP="Valor 3 para ordenar"';
                }
                field("Value 4"; ANJ01Arry[4])
                {
                    ApplicationArea = All;
                    Caption = 'Value 4', comment = 'ESP="Valor 4"';
                    ToolTip = 'Value 4 to order', comment = 'ESP="Valor 4 para ordenar"';
                }
                field("Value 5"; ANJ01Arry[5])
                {
                    ApplicationArea = All;
                    Caption = 'Value 5', comment = 'ESP="Valor 5"';
                    ToolTip = 'Value 5 to order', comment = 'ESP="Valor 5 para ordenar"';
                }
                field("Value 6"; ANJ01Arry[6])
                {
                    ApplicationArea = All;
                    Caption = 'Value 6', comment = 'ESP="Valor 6"';
                    ToolTip = 'Value 6 to order', comment = 'ESP="Valor 6 para ordenar"';
                }
                field("Value 7"; ANJ01Arry[7])
                {
                    ApplicationArea = All;
                    Caption = 'Value 7', comment = 'ESP="Valor 7"';
                    ToolTip = 'Value 7 to order', comment = 'ESP="Valor 7 para ordenar"';
                }
                field("Value 8"; ANJ01Arry[8])
                {
                    ApplicationArea = All;
                    Caption = 'Value 8', comment = 'ESP="Valor 8"';
                    ToolTip = 'Value 8 to order', comment = 'ESP="Valor 8 para ordenar"';
                }
                field("Value 9"; ANJ01Arry[9])
                {
                    ApplicationArea = All;
                    Caption = 'Value 9', comment = 'ESP="Valor 9"';
                    ToolTip = 'Value 9 to order', comment = 'ESP="Valor 9 para ordenar"';
                }
                field("Value 10"; ANJ01Arry[10])
                {
                    ApplicationArea = All;
                    Caption = 'Value 10', comment = 'ESP="Valor 10"';
                    ToolTip = 'Value 10 to order', comment = 'ESP="Valor 10 para ordenar"';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Sort)
            {
                Caption = 'Sort', comment = 'ESP="Ordenar"';
                ToolTip = 'Launch sorting process', comment = 'ESP="Lanzar proceso ordenar"';
                ApplicationArea = All;

                trigger OnAction()
                var
                    ANJSortingAlgorithm: Codeunit "ANJ01 Sorting Algorithm";
                    ANJ01AuxArry: array[10] of decimal;
                begin
                    CopyArray(ANJ01AuxArry, ANJ01Arry, 1, 10);
                    ANJSortingAlgorithm.sort(ANJ01AuxArry, ANJ01Algorithmtype);
                    ANJSortingAlgorithm.ShowResult(ANJ01AuxArry);
                end;
            }
        }
    }
    var
        ANJ01Algorithmtype: Enum "ANJ01 Algorithm type";
        ANJ01Arry: array[10] of decimal;
}