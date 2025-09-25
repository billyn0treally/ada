with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p20 is


    procedure sum (N1 : in out Integer ; N2 : in out Integer ; Result : out Integer ) is
    begin
    Put("Mata in ett heltal: ");
    Get(N1);
    Put("Mata in ett heltal: ");
    Get(N2);
    Result := N1 + N2;
    end sum;

    function radie (F1 : in Float) return Float is
    begin
        return (F1 * F1 * 3.14);
    end radie;

    function "*" (S : in String ; C : in Character) return Float is
        F : Float;
    begin
        F := (Float'Value(S) * Float((Character'Pos(C)-Character'Pos('0'))));
        return F;
    end "*";


    S : String(1..3);
    C : Character;
    N1, N2, Result: Integer;
    F1 : Float;

begin

    sum(N1, N2, Result);
    Put("Du matade in heltalet: ");
    Put(N1, Width => 0);
    Put(" och heltalet: ");
    Put(N2, Width => 0);
    Put(" och summan blev ");
    Put(Result);
    New_Line(2);
    Skip_Line;

    Put("Mata in längden: ");
    Get(F1);
    --Put(radie(F1));
    Put("Den beräknade arean blev: ");
    Put((radie(F1)), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in ett tecken: ");
    Get(C);
    Put("Mata in en sträng: ");
    Get(S);
    Put("Den beräknade produkten av ");
    Put(C);
    Put(" och ");
    Put(S); 
    Put(" blir ");
    Put((S*C), Fore => 0, Aft => 1, Exp => 0);
    --New_Line(2);
    Skip_Line;

end p20;
