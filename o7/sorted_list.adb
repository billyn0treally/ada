--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body sorted_list is

    procedure Insert(LT : in out List_Type; I : in Integer) is
    begin

    function Empty(LT : in List_Type) return Boolean is
    begin
        --return (LT = null);
        if LT = null then
            return False;
        else 
            return True;
        end if;
    end Empty;

    procedure Put(LT : in List_Type) is
    begin
        if Empty(LT) then
            null;
        else Put(Lt.Data, W => 0);
        Put(LT.Next);
    end if;
    end Put;

end sorted_list;
