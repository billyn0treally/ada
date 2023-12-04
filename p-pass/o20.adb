with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure o20 is 

    procedure div (N : in out Integer ; S : in out String; Result : out Float ) is
    begin
    Put("Mata in ett heltal: ");
    Get(N);
    Put("Mata in en sträng med exakt 3 tecken: ");
    Get(S);
    Result := Float'Floor(Float(N) / Float'Value(S));
    end div;

    function medel (F1, F2, F3 : in Float) return Integer is
    begin
        return Integer(Float'Floor((F1 + F2 + F3) / 3.0));
    end medel;

    function "-" (S : in String ; F1 : in Float) return Float is
    begin
        return Float'Value(S) - F1;
    end "-";

    S : String(1..3);
    N : Integer;
    F1, F2, F3 : Float;
    --C : Character;
    Result : Float;

begin

    div(N, S, Result);
    Put("Du matade in heltalet: ");
    Put(N, Width => 0);
    Put(" och strängen: ");
    Put(S); -- Fore => 0, Aft => 1, Exp => 0);
    Put(" och kvoten blev ");
    Put(Result);
    New_Line(2);
    Skip_Line;

    Put ("Mata in tre flyttal: ");
    Get (F1);
    Get (F2);
    Get (F3);
    Put ("Medelvärdet av dessa är: ");
    Put (medel (F1, F2, F3), Width => 0);
    New_Line (2);
    Skip_Line;

    Put("Mata in en sträng: ");
    Get(S);
    Put("Mata in ett flyttal: ");
    Get(F1);
    Put("Den beräknade differensen mellan ");
    Put(S);
    Put(" och ");
    Put(F1, Fore => 0, Aft => 1, Exp => 0);
    Put(" blir ");
    Put((S-F1), Fore => 0, Aft => 1, Exp => 0);
    Skip_Line;

end o20;
