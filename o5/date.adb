with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Exceptions;      use Ada.Exceptions;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

package body date is

--    type Date_Type is record
--        Day, Month, Year : Integer;
--    end record;

    procedure Get (D: in out Date_Type) is
        Bound   : Integer := 30;
        F       : Float;
    begin
        Get(S);
        if S (5) /= '-' or S (8) /= '-' then
            raise Format_Error;
        end if;
        D.Year  := Integer'Value (S(1 .. 4));
        D.Month := Integer'Value (S(6 .. 7));
        D.Day   := Integer'Value (S(9 .. 10));
        if D.Year < 1532 or D.Year > 9000 then
            raise Year_Error;
        end if;
        if D.Month > 12 then
            raise Month_Error;
        end if;
        if D.Month mod 2 = 0 then
            Bound := 31;
        end if;
        if D.Month = 2 then
            -- Ex: 1992 % 4 = 0 -> 1*0/3 = 0.0 -> Ceil(0.0) = 0
            -- Ex: 1995 % 4 = 3 -> 1*3/6 = 0.5 -> Ceil(0.5) = 1
            F := Float'Ceiling(1.0 * (Float (D.Year mod 4)) / 
            (3.0 + (Float (D.Year mod 4))));
            -- 29 - 1 -> Not Leap-Year, 29 - 0 -> Leap-Year   
            Bound := 29 - Integer (F);
        end if;
        if D.Day > Bound then
            raise Day_Error;
        end if;
    end Get;

    -- Output whole date array and insert zeros where needed
    procedure Put ( D : in Date_Arr_Type ) is
    begin
        for  i in D'Range loop

            Put ("Datum nummer ");
            Put (I, 0);
            Put (": ");
            Put (D (I).Year, 0);
            Put ("-");
            if (D (I).Month / 10) < 1 then
                Put ("0");
            end if;
            Put (D (I).Month, 0);
            Put ("-");
            if (D (I).Day / 10) < 1 then
                Put ("0");
            end if;
            Put (D (I).Day, 0);
            if I /= D'Last then
                New_Line;
            end if;
        end loop;
    end Put;

    -- Prompts for user-input which then is checked for errors. Part of Del_3
    function Query (I : Integer) return Date_Type is
    begin
        Put ("Mata in datum ");
        Put (I, Width => 0);
        Put (": ");
        Get (Dates (I));
        return Dates (I);

    exception
        when Format_Error =>
            Put ("Felaktigt format! ");
            return Query (I);
        when Year_Error =>
            Put ("Felaktigt år! ");
            return Query (I);
        when Month_Error =>
            Put ("Felaktig månad! ");
            return Query (I);
        when Day_Error =>
            Put ("Felaktig dag! ");
            return Query (I);
    end Query;

end date;

