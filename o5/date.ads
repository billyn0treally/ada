--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
package date is

    type Date_Type is private;

    procedure Get(D : out Date_Type);
    procedure Put(D : in Date_Type);

    function Next_Date(D : in Date_Type) return Date_Type;
    function Previous_Date(D : in Date_Type) return Date_Type;

--    function "<"(L, R: in Date_Type) return Boolean;
--    function ">"(L, R: in Date_Type) return Boolean;
    function "="(L, R: in Date_Type) return Boolean;

    Length_Error, Format_Error, Year_Error, Month_Error, Day_Error : exception;

    private
    type Date_Type is record
        Y, M, D: Integer;
    end record;

end date;
