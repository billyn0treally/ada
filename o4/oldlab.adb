--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Exceptions;      use Ada.Exceptions;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Test_Exceptions is

    type Date_Type is record
        Day, Month, Year : Integer;
    end record;

    type Date_Arr_Type is array (1 .. 3) of Date_Type;

    Min, Max, Value : Integer;
    S_1 : String(1 .. 5);
    S_2 : String(2 .. 7);
    S_3 : String(1 .. 10);
    Dates : Date_Arr_Type;

    Lenght_Error, Format_Error, Year_Error, Month_Error, Day_Error : exception;

    -- Part One
    procedure Get_Value_Safe (Min, Max : in Integer; Value : out Integer) is
    begin
        Put_Line ("Mata in värde (" & Min'Image & " - " & Max'Image & "): ");
        loop
            Get(Value);
            if Min <= Value and  Value <= Max then
                exit;
            else Put("Testa igen: ");
        end if;
    end loop;
end Get_Value_Safe;

-- Part Two
procedure Get ( Item : out String) is
    C        : Character;
    Index    : Integer := 0;
    EOL      : Boolean := False;
begin
    loop
        if EOL then
            raise Lenght_Error;
        end if;  

        Ada.Text_IO.Get(C);

        if Index = 0 and C = ' ' then
            Index := 0;

        elsif Index <= Item'Length then
            Item (Item'First + Index) := C;
            Index := Index + 1;
        end if;
        if Index >= Item'Length then
            exit;
        end if;
        Ada.Text_IO.Look_Ahead (C, EOL); 
    end loop;
end Get;

-- Part Three
procedure Get (D : in out Date_Type) is
    Bound   : Integer := 30;
    F       : Float;
begin
    Get(S_3);
    if S_3 (5) /= '-' or S_3 (8) /= '-' then
        raise Format_Error;
    end if;
    D.Year  := Integer'Value (S_3 (1 .. 4));
    D.Month := Integer'Value (S_3 (6 .. 7));
    D.Day   := Integer'Value (S_3 (9 .. 10));
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

-- partition main program into subroutines too 

	-- Part one of the assignement
   procedure Del_1 is
   begin
      Put_Line ("Del 1:");
      Put ("Mata in Min och Max: ");
      Get (Min);
      Get (Max);
      Get_Value_Safe (Min, Max, Value);
      Put ("Du matade in heltalet ");
      Put (Value, Width => 0);
      Put ('.');
      New_Line (2);
      Skip_Line;
   end Del_1;

   procedure Del_2 is
   begin
      Put_Line ("Del 2:");
      Put ("Mata in en sträng på exakt 5 tecken: ");
      Get (S_1);
      Put_Line ("Du matade in " & S_1);
      Put ("Mata in en sträng  på exakt 6 tecken: ");
      Get (S_2);
      Put_Line ("Du matade in " & S_2);
      Put ("Mata in en sträng på exakt 10 tecken: ");
      Get (S_3);
      Put ("Du matade in " & S_3);
      New_Line (2);
      Skip_Line;
   end Del_2;

   procedure Del_3 is
   begin
      Put_Line ("Del 3:");
      for I in Dates'Range loop
         Dates (I) := Query (I); 
      end loop;
      Put (Dates);
   end Del_3;

    begin
        Del_1;
        Del_2;
        Del_3;

        exception
            when Lenght_Error =>
                Put_Line ("För få inmatade tecken! ");

        end Test_Exceptions;
