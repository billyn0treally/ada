with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p20 is

    procedure larger (F1, F2 : in Float; Result : out Float) is
    begin
        if F1 > F2 then
            Result := Float'Ceiling(F1);
        else
            Result := Float'Ceiling(F2);
        end if;
    end larger;

    function "+" (S : in String ; C : in Character) return Float is
        F : Float;
    begin
        F := Float'Ceiling(Float'Value(S) + Float((Character'Pos(C)-Character'Pos('0'))));
        return F;
    end "+";

    function radie (S : in String) return Integer is
    begin
        return Integer((Float'Value(S) * Float'Value(S) * 3.14));
    end radie;

    F1, F2, Result : Float;
    S : String(1..3);
    C : Character;

begin

    Put("Mata in två flyttal: ");
    Get(F1);
    Get(F2);
    Put("Det största värdet av dessa är: ");
    larger(F1, F2, Result);
    Put((Result), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in en sträng: ");
    Get(S);
    Put("Mata in ett tecken: ");
    Get(C);
    Put("Den beräknade summan av ");
    Put(S);
    Put(" och ");
    Put(C); 
    Put(" blir ");
    Put((S+C), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in längden: ");
    Get(S);
    Put("Den beräknade arean blev: ");
    Put(radie(S), Width => 0);
    Skip_Line;

end p20;
