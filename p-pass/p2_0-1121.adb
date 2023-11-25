with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p2_0 is

    function "*" (F : in Float ; S : in String) return Integer is
    begin
        return Integer(Float'Floor(F * Float(Integer'Value(S))));
    end "*";

    function sub (C : in Character) return Integer is
        diff : Integer;
    begin
        diff := (Character'Pos(C) - Character'Pos('0')) - Integer(32.7);
        return diff;
    end sub;

    procedure div (F : in out Float ; S : in out String ; Result : out Integer ) is
--        Result : Integer;
    begin
    Put("Mata in ett flyttal: ");
    Get(F);
    Put("Mata in en sträng med exakt 3 tecken: ");
    Get(S);
    Put("Du matade in flyttalet: ");
    Put(F, Fore => 0, Aft => 1, Exp => 0);
    Put (" och strängen: ");
    Put(S);
    Put(" och kvoten blev ");
    Result := Integer(Float'Floor(F / Float(Integer'Value(S))));

    end div;

    S : String(1..3);
    N : Integer;
    F : Float;
    C : Character;
    kvot : Integer;

begin

    Put("Mata in ett flyttal: ");
    Get(F);
    Put("Mata in en sträng: ");
    Get(S);
    Put("Den beräknade produkten av ");
    Put(F, Fore => 0, Aft => 1, Exp => 0);
    Put(" och ");
    Put(S);
    Put(" blir ");
    Put(F*S, Width => 1);
    New_Line(2);
    Skip_Line;

    Put("Mata in ett tecken: ");
    Get (C);
    Put("differensen mellan ");
    Put(C);
    Put(" och 32.7 blir ");
    Put(sub(C), Width => 1);
    New_Line(2);
    Skip_Line;

    div(F, S, kvot);
    Put(kvot);


end p2_0;
