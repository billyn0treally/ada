with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p20 is

    function "*" (S : in String ; C : in Character) return Integer is
    begin
        return (Character'Pos(C) - Character'Pos('0')) * Integer'Value(S);
    end "*";

    procedure mul (S : out String ; F : out Float ; N : out Integer) is
    begin
    Put("Mata in en sträng med exakt 3 tecken: ");
    Get(S);
    Put("Mata in ett flyttal: ");
    Get(F);
    N := Integer(Float'Floor((Float'Value(S)) * F));
    end mul;

    function rad (N : in Integer) return Integer is
    begin
        return Integer(Float(N * N * 3.14));
    end rad;


    S : String(1..3);
    N: Integer;
    F : Float;
    C : Character;

begin

    Put("Mata in en sträng: ");
    Get(S);
    Put("Mata in ett tecken: ");
    Get(C);
    Put("Den beräknade produkten av ");
    Put(S);
    Put(" och ");
    Put(C);
    Put(" blir ");
    Put((S*C), Width => 1);
    New_Line(2);
    Skip_Line;
    
    mul(S,F,N);
    Put("Du matade in strängen: ");
    Put(S);
    Put(" och flyttalet: ");
    Put((F), Fore => 0, Aft => 1, Exp => 0);
    Put(" och produkten blev ");
    Put(N);
    New_Line(2);
    Skip_Line;
    

    Put("Mata in längden: ");
    Get(N);
    Put("Den beräknade arean blev: ");
    Put(rad(N), Width => 1);
    Skip_Line;

end p20;
