with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p20 is

    function add ( C : in Character) return Float is
        F : Float;
    begin
        F := Float'Ceiling(Float((Character'Pos(C)-Character'Pos('0'))) + 32.7);
        return F;
    end add;

    procedure kvot (S : out String ; F2 : out Float ; Result : out Float ) is
    begin
    Put("Mata in en sträng med exakt 3 tecken: ");
    Get(S);
    Put("Mata in ett flyttal: ");
    Get(F2);
    Result := Float'Value(S) / F2;
    end kvot;


    function "-" (F1 : in Float ; N1 : in Integer) return Integer is
        N : Integer;
    begin
        N := Integer(Float'Ceiling(F1)) - N1;
        return N;
    end "-";

    S : String(1..3);
    C : Character;
    F1, F2, Result : Float;
    N1 : Integer;

begin
    Put("Mata in ett tecken: ");
    Get(C);
    Put("summan av ");
    Put(C);
    Put(" och 32.7 blir ");
    Put((add(C)), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    kvot(S, F2, Result);
    Put("Du matade in strängen: ");
    Put(S);
    Put(" och flyttalet: ");
    Put((F2), Fore => 0, Aft => 1, Exp => 0);
    Put(" och kvoten blev ");
    Put(Result);
    New_Line(2);
    Skip_Line;

    Put("Mata in ett flyttal: ");
    Get(F1);
    Put("Mata in ett heltal: ");
    Get(N1);
    Put("Den beräknade differensen mellan ");
    Put((F1), Fore => 0, Aft => 1, Exp => 0);
    Put(" och ");
    Put((N1), Width => 0); 
    Put(" blir ");
    Put((F1-N1), Width => 0);
    Skip_Line;

end p20;
