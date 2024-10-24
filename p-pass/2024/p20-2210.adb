with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p20 is

    function "*" (S : in String ; C : in Character) return Integer is
    begin
        return (Character'Pos(C) - Character'Pos('0')) * Integer'Value(S);
    end "*";

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

end p20;
