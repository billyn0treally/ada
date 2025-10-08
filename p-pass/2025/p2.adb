with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

--proc
--operator
--median 
procedure p2 is

    procedure sub (C : out Character ; S : out String ; Result : out Integer ) is
    begin
        Put("Mata in ett tecken: ");
        Get(C);
        Put("Mata in en sträng med exakt 3 tecken: ");
        Get(S);
        Result := (Character'Pos(C)-Character'Pos('0')) - Integer(Float'Rounding(Float'Value(S)));
    end sub;

    function "/" (S : in String ; N1 : in Integer) return Float is
        F : Float;
    begin
        F := Float'Value(S) / Float(N1);
        return F;
    end "/";

    function median (F1, F2, F3 : in Float) return Integer is
    begin
        if F1 <= F2 and F2 <= F3 then
            return Integer(Float'Rounding(F2));
        elsif F2 <= F1 and F1 <= F3 then
            return Integer(Float'Rounding(F1));
        else
            return Integer(Float'Rounding(F3));
        end if;

    end median;


    F1, F2, F3 : Float;
    N1, Result : Integer;
    S : String(1..3);
    C : Character;
begin

    sub(C, S, Result);
    Put("Du matade in tecknet: ");
    Put(C);
    Put(" och strängen: ");
    Put(S);
    Put(" och differensen blev ");
    Put(Result);
    New_Line(2);
    Skip_Line;

    Put("Mata in en sträng: ");
    Get(S);
    Put("Mata in ett heltal: ");
    Get(N1);
    Put("Den beräknade kvoten mellan ");
    Put(S);
    Put(" och ");
    Put(N1, Width => 0); 
    Put(" blir ");
    Put((S/N1), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in tre flyttal: ");
    Get(F1);
    Get(F2);
    Get(F3);
    Put("Medianen av dessa är: ");
    Put(median(F1, F2, F3), Width => 0);
    Skip_Line;


end p2;



