--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body sorted_list is

    -- Node är hela structen med värde och pekare till nästa nod
    -- List_Type är en pekare till nästa Node
    -- crazy
    procedure Insert(List : in out List_Type; I : in Integer) is
        tmp : List_Type;
    begin
        if Empty(List) then
            List := new Node;
            List.Data := I;
            List.Next := null;
        elsif I < List.Data then
            tmp := List;
            List := new Node;
            List.Data := I;
            List.Next := tmp;
        end if;
    end Insert;

    function Empty(List : in List_Type) return Boolean is
    begin
        -- vi kan skippa if satsen om vi kör dubbel bool goingen
        return (List = null);
        --if List = null then
        --    return False;
        --else 
        --    return True;
        --end if;
    end Empty;

    procedure Put(List : in List_Type) is
    begin
        if Empty(List) then
            null;
        else Put(" ");
        Put(List.Data, Width => 0);
        Put(List.Next);
    end if;
    end Put;

end sorted_list;
