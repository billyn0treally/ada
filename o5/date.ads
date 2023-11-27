--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
package date is

    Format_Error, Year_Error, Month_Error, Day_Error : exception;

    type Date_Type is private;
    procedure Get(Item : out Date_Type);
    procedure Put(Item : in Date_Type);

    function Next_Date(D : in Date_Type) return Date_Type;
    function Previous_Date(D : in Date_Type) return Date_Type;

    function "<"(L, R: in Date_Type) return Boolean;
    function ">"(L, R: in Date_Type) return Boolean;
    function "="(L, R: in Date_Type) return Boolean;


    private
    type Date_Type is record
        Y, M, D: Integer;
    end record;

    --type Month_Type;
    --type Day_Type;
    --type Days_In_Month_Map;

    -- i adb
    type Month_Type is range 1 .. 12;
    type Day_Type is range 1 .. 31;
    type Days_In_Month_Map is array (Month_Type) of Day_Type;

end date;
