--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
package sorted_list is

    No_Such_Element_Error : exception;

    type List_Type is private;

    function Empty(List : in List_Type) return Boolean;

    procedure Insert(List : in out List_Type; I : in Integer);

    procedure Put(List : in List_Type);

    function Member(List : in List_Type; Key : in Integer) return Boolean;

    procedure Remove(List : in out List_Type; Key : in Integer);

    procedure Delete(List : in out List_Type);

    function Length(List : in List_Type) return Integer;

    private 

    type Node;

    type List_Type is
        access Node;

        type Node is record
            Data : Integer;
            Next : List_Type;
        end record;

end sorted_list;
