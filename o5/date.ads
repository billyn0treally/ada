package date is

    type Date_Type is private;
    --type Date_Arr_Type is private;

    procedure Get(D : out Date_Type);
    procedure Put(D : in Date_Type);

--    function Next_Date(D : in Date_Type) return Date_Type;
--    function Previous_Date(D : in Date_Type) return Date_Type;

--    function "<"(Left, Right : in Date_Type) return Boolean;
--    function ">"(Left, Right : in Date_Type) return Boolean;
--    function "="(Left, Right : in Date_Type) return Boolean;

    Format_Error, Year_Error, Month_Error, Day_Error : exception;

    private
--    S : String;
--    type Date_Arr_Type is array (1 .. 3) of Date_Type;
    type Date_Type is record
        Day, Month, Year : Integer;
    end record;

end date;
