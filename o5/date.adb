with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Exceptions;      use Ada.Exceptions;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

package body date is

    function IsLeap ( D : in Date_Type) return Boolean is
        Leap : Boolean;
    begin

      if (D.Year mod 4) = 0 then
	 Leap := True;
	 elsif (D.Year mod 100) = 0 then
	    Leap := False;
	    elsif (D.Year mod 400) = 0 then
	       Leap := True;
	    end if;
   	 --end if;
      --end if;
      return Leap;
    end IsLeap;
      

    procedure FormatCheck (S : in String; A, B : in Integer) is
    begin
        for I in A .. B loop
            if S(I) < '0' or S(I) > '9' then
                raise Format_Error;
            end if;
        end loop;
    end FormatCheck;

    function DayCheck (D : in Date_Type) return Boolean is
    begin
        if D.Day > 31 or D.Day <= 00 then
            return False;

        elsif D.Day = 31 and (D.Month = 4 or D.Month = 6 or D.Month = 9 or D.Month = 11) then
            return False;

        elsif D.Day > 29 and D.Month = 2 then
            return False;

        elsif D.Day > 29 and D.Month = 2 and IsLeap(D) = False then
            return False;

        else
            return True;
    end if;
end DayCheck;

    function MonthCheck (D : in Date_Type) return Boolean is
    begin
        if D.Month > 12 or D.Month <= 0 then
            return False;
        else
            return True;
        end if;
    end MonthCheck;


    procedure DateCheck (D : in Date_Type) is
    begin
        if D.Year < 100 or D.Year >= 10000 then
            raise Format_Error;
        elsif D.Year < 1532 or D.Year > 9000 then
            raise Year_Error;
        elsif MonthCheck(D) = False then
            raise Month_Error;
        elsif DayCheck(D) = False then
            raise Day_Error;
        end if;
    end DateCheck;

    procedure Get (D : out Date_Type) is
        S       : String(1..10);
    begin
        Get(S);
        if S (5) /= '-' or S (8) /= '-' then
            raise Format_Error;
        end if;

        -- Check formatting
        FormatCheck(S,1,4);
        FormatCheck(S,6,7);
        FormatCheck(S,9,10);

        -- string to integer
        D.Year  := Integer'Value (S(1 .. 4));
        D.Month := Integer'Value (S(6 .. 7));
        D.Day   := Integer'Value (S(9 .. 10));

        -- Cheack values for casting    
        DateCheck(D);
    end Get;


    -- Output whole date array and insert zeros where needed
    procedure Put (D : in Date_Type) is
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

