--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body sorted_list is

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

    procedure Put(List : in List_Type) is
    begin
        if Empty(List) then
            null;
        else Put(" ");
        Put(List.Data, Width => 0);
        Put(List.Next);
        end if;
    end Put;

    function Member(List : in List_Type; Key : in Integer) return Boolean is
    begin
        if Empty(List) then
            return False;
        elsif List.Data = Key then
            return True;
        else return Member(List.Next, Key);
    end if;
    end Member;

    procedure Remove(List : in out List_Type; Key : in Integer) is
        tmp : List_Type;
    begin
        if Empty(List) then
            raise No_Such_Element_Error;
        end if;
        if List.Data = Key then
            tmp := List;
            List := tmp.Next;
            Free(tmp);
            return;
        end if;
        Remove (List.Next, Key);
    end Remove;

    procedure Delete(List : in out List_Type) is
        tmp : List_Type;
    begin
        tmp := null;
        if List = null then
            return;
        else
            tmp := List.Next;
            Free(List);
            List := tmp;
            Delete(List);
        end if;
    end Delete;

    function Length(List : in List_Type) return Integer is
    begin
        if List = null then
            return 0;
        else 
            return 1 + Length(List.Next);
        end if;
    end Length;

end sorted_list;
