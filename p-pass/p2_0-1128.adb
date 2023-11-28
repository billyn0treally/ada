with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p2_0 is

    procedure sum (N : in out Integer ; F : in out Float ; Result : out Float ) is
    begin
    Put("Mata in ett heltal: ");
    Get(N);
    Skip_Line;
    Put("Mata in ett flyttal: ");
    Get(F);
    Skip_Line;
    Result := Float(N) + F;
    end sum;

    function "/" (C : in Character; S : in String) return Float is
        kvot : Float;
    begin
        kvot := Float((Character'Pos(C) - Character'Pos('0'))) / Float'Value(S);
        return kvot;
    end "/";

    function mul (N : in Integer) return Float is
    begin
        return Float(N) * 32.7;
    end mul;

    S : String(1..3);
    N : Integer;
    F : Float;
    C : Character;
    Result : Float;

begin
    sum(N, F, Result);
    Put("Du matade in heltalet: ");
    Put(N, Width => 0);
    Put(" och flyttalet: ");
    Put(F, Fore => 0, Aft => 1, Exp => 0);
    Put(" och summan blev ");
    Put(Result);
    New_Line(2);
    Skip_Line;

    Put("Mata in ett tecken: ");
    Get(C);
    Put("Mata in en sträng: ");
    Get(S);
    Put("Den beräknade kvoten av ");
    Put(C);
    Put(" och ");
    Put(S);
    Put(" blir ");
    Put(C/S, Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;


    Put("Mata in ett heltal: ");
    Get (N);
    Put("differensen mellan ");
    Put(C);
    Put(" och 32.7 blir ");
    Put(mul(N), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;
end p2_0;
