--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Exceptions;      use Ada.Exceptions;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

package body date is

    -- Kollar om det är skottår eller inte
    function IsLeap (N : in Integer) return Boolean is
    begin
        if (N mod 4 = 0 and N mod 100 /= 0) or (N mod 400 = 0) then
            return True;
        else
            return False;
        end if;
    end IsLeap;

    -- Kontrollera formatering på användarens indata
    procedure CheckFmt (S : in String) is
    begin
        if S(5) /= '-' or S(8) /= '-' or S'Length /= 10 then
            raise Format_Error;
        end if;

        for I in 1 .. 4 loop
            if S (I) < '0' or S (I) > '9' then
                raise Format_Error;
            end if;
        end loop;

        for I in 1 .. 2 loop
            if S (I + 5) < '0' or S (I + 5) > '9' then
                raise Format_Error;
            elsif S (I + 8) < '0' or S (I + 8) > '9' then
                raise Format_Error;
            end if;
        end loop;
    end CheckFmt;

    procedure Get_Correct_String (S : out String) is
        C            : Character;
        GotCharacter : Boolean := False;
    begin
        loop
            Get (C);
            if C = ' ' then
                null;
            elsif C /= ' ' and not End_Of_Line then
                GotCharacter := True;
                exit;
            elsif C /= ' ' and End_Of_Line then
                raise Length_Error;
            end if;
        end loop;

        S (S'First) := C;

        for I in S'First + 1 .. S'Last loop
            Get (C);
            S (I) := C;
            exit when I = S'Last;
            if End_Of_Line then
                raise Length_Error;
            end if;
        end loop;
    end Get_Correct_String; 

    procedure Get (Item : out Date_Type) is
        S : String (1 .. 10);
    begin
        Get_Correct_String (S);
        CheckFmt(S);

        -- Assign Int values to string's chars
        Item.Y := Integer'Value (S (1 .. 4));
        Item.M := Integer'Value (S (6 .. 7));
        Item.D := Integer'Value (S (9 .. 10));

        if (Item.Y > 9_000 or Item.Y < 1_532) then
            raise Year_Error;

        elsif (Item.M = 00 or Item.M > 12) then
            raise Month_Error;

        elsif Item.D > 31 or Item.D = 0 then
            raise Day_Error;

        elsif Item.D = 31 and
            (Item.M = 4 or Item.M = 6 or Item.M = 9 or Item.M = 11)
        then
            raise Day_Error;

        elsif Item.D > 29 and Item.M = 2 then
            raise Day_Error;

        elsif Item.D = 29 and Item.M = 2 and IsLeap (Item.Y) = False then
            raise Day_Error;
        end if;
    exception
        when Format_Error =>
            raise Length_Error;
    end Get;

    procedure DoubleDigit (Item : in Integer) is
    begin
        if Item <= 9 then
            Put('0');
        end if;
    end DoubleDigit;

    procedure Put (Item : in Date_Type) is
    begin
        Put (Item.Y, Width => 1);
        Put ("-");
        DoubleDigit(Item.M);
        Put (Item.M, Width => 1);
        Put ("-");
        DoubleDigit(Item.D);
        Put (Item.D, Width => 1);
    end Put;

    procedure Last_Day (D : in out Date_Type) is
    begin
        if D.M= 4 or D.M= 6 or D.M= 9 or D.M= 11 then
            D.D:= 30;
        elsif D.M= 2 and IsLeap(D.Y) = True then
            D.D:= 29;
        elsif D.M= 2 and IsLeap(D.Y) = False then
            D.D:= 28;
        else D.D:= 31;
        end if;
    end Last_Day;

    function ValidDay (D : in Date_Type) return Boolean is 
    begin

        if D.D > 31 or D.D <= 00 then
            return False;

        elsif D.D = 31 and(D.M = 4 or D.M = 6 or D.M = 9 or D.M = 11) then
            return False; 

        elsif D.D > 29 and D.M = 2 then 
            return False;

        elsif D.D = 29 and D.M = 2 and IsLeap(D.Y) = False then
            return False;
        else
            return True;
        end if;

    end ValidDay;

    function ValidMonth (D: in Date_Type) return Boolean is
    begin
        if D.M <= 0 or D.M > 12 then
            return False;
        else 
            return True;
        end if;

    end ValidMonth;

    function Next_Date (D : in Date_Type) return Date_Type is
        next : Date_Type;
    begin
        next := D;
        next.D:= D.D + 1;
        if ValidDay(next) then
            return next;
        else
            next := D;
        end if;

        next.D := 1;
        next.M := next.M + 1;
        if ValidMonth(next) then
            return next;
        else next := D;
        end if;

        next.D := 1;
        next.M := 1;
        next.Y := next.Y + 1;
      if next.Y > 9000 then
          raise Year_Error;
      end if;
        return next;
    end Next_Date;

    function Previous_Date (D : in Date_Type) return Date_Type is
        prev : Date_Type;
    begin
        prev := D;
        prev.D := prev.D - 1;
        if ValidDay(prev) then
            return prev;
        else
            prev := D;
        end if;

        prev.M := prev.M - 1;
        Last_Day(prev);
        if ValidMonth(prev) then
            return prev;
        else 
            prev := D;
        end if;

        prev.Y := prev.Y - 1;
        prev.M := 12;
        prev.D := 31;
       if prev.Y < 1532 then
       raise Year_Error;
       end if;
        return prev;
    end Previous_Date;

function "=" (L,R : in Date_Type) return Boolean is
begin
    if L.Y = R.Y and L.M = R.M and L.D = R.D then
        return True;
    else
        return False;
    end if;
end "=";

function ">" (L, R : in Date_Type) return Boolean is
begin
    if (L<R) = False and (L=R) = False then
        return True;
    else
        return False;
    end if;
end ">";

function "<" (L, R : in Date_Type) return Boolean is
    Low : Date_Type;
    Tmp : Date_Type;
begin
    Low.Y := 1535; Low.M := 1; Low.D :=1;
    Tmp := R;
    while Tmp /= Low loop
        Tmp := Previous_Date(Tmp);
        if L = Tmp then
            return True;
            end if;
        end loop;
        return False;
end "<";
end date;

