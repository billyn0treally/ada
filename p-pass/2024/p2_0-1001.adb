with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p2_0 is

    procedure diff (F1, F2 : in out Float ; N : out Integer) is
    begin
        Put("Mata in ett flyttal: ");
        Get(F1);
        Put("Mata in ett flyttal: ");
        Get(F2);
        N:= Integer(Float'Ceiling(F1 - F2));
    end diff;

    function "+" (F1 : in FLoat ; S : in String) return Float is
    begin
        return FLoat(F1 + Float'Value(S));
    end "+";

    function rad (S : in String) return Integer is
    begin
        return Integer(Float'Rounding(Float'Value(S)) * Float'Value(S) * 3.14);
    end rad;

    S : String(1..3);
    N: Integer;
    F1, F2 : Float;

begin

    diff(F1, F2, N);
    Put("Du matade in flyttalet: ");
    Put(F1, Fore => 0, Aft => 1, Exp => 0);
    Put(" och flyttalet: ");
    Put(F2, Fore => 0, Aft => 1, Exp => 0);
    Put(" och differensen blev ");
    Put(N);
    New_Line(2);
    Skip_Line;

    Put("Mata in ett flyttal: ");
    Get(F1);
    Put("Mata in en sträng: ");
    Get(S);
    Put("Den beräknade summan av ");
    Put(F1, Fore => 0, Aft => 1, Exp => 0);
    Put(" och ");
    Put(S);
    Put(" blir ");
    Put((F1+S), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in längden: ");
    Get(S);
    Put("Den beräknade arean blev: ");
    Put(rad(S), Width => 1);
    Skip_Line;

end p2_0;
