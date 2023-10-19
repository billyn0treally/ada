--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
package sorted_list is

    No_Such_Element_Error : exception;

    type List_Type is private;

    function Empty(LT : in List_Type) return Boolean;
    --function Member(LT : in List_Type; Key : in Integer) return Boolean;
    --function Length(LT : in List_Type) return Integer;

    procedure Insert(LT : in out List_Type; I : in Integer);
    procedure Put(LT : in List_Type);
    --procedure Remove(LT : in out List_Type; Key : in Integer);
    --procedure Delete(LT : in out List_Type);

    private 

    type Ptr;

    type List_Type is
        access Ptr;

        type Ptr is record
            Data : Integer;
            Next : List_Type;
        end record;

end sorted_list;
