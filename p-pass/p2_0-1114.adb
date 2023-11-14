with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p2_0 is

    function "-" (S : in String ; N : in Integer) return Float is
        F : Float;
    begin
        F := Float(Integer'Value(S) - N);
        return F;
    end "-";


    procedure mul (F : in out Float ; S : in out String ) is
    begin
    Put("Mata in ett flyttal: ");
    Get(F);
    Put("Mata in en sträng med exakt 3 tecken: ");
    Get(S);
    Put("Du matade in flyttalet: ");
    Put(F, Fore => 0, Aft => 1, Exp => 0);
    Put (" och strängen: ");
    Put(S);
    Put(" och produkten blev ");
    Put(Float'Floor(F * Float(Integer'Value(S))));

    end mul;

    function add (C : in Character) return Float is
        Sum : Float;
    begin

        Sum := 32.7 + Float(Character'Pos(C));
        --Sum := Round(Sum);
        return Sum;

    end add;

    S : String(1..3);
    N : Integer;
    F : Float;
    C : Character;

begin

    Put("Mata in en sträng: ");
    Get(S);
    Put("Mata in ett heltal: ");
    Get(N);
    Put("Den beräknade differensen mellan ");
    Put(S);
    Put(" och ");
    Put(N, Width => 1);
    Put(" blir ");
    Put((S-N), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    mul(F, S);
    New_Line(2);
    Skip_Line;

    Put("Mata in ett tecken: ");
    Get (C);
    Put("summan av ");
    Put(C);
    Put(" och 32.7 blir ");
    Put(add(C),Fore => 0, Aft => 1, Exp => 0);

end p2_0;
