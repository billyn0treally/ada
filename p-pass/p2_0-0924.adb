with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p2_0 is

    function "/" (F : in Float ; C : in Character) return Float is 
        kvot : Float;
    begin
        kvot := Float'Ceiling(F/Float((Character'Pos(C) - Character'Pos('0'))));
        return kvot;
    end "/";

    procedure rad (N : in out Integer) is
    begin
        N := Integer(Float(N * N * 3.14));
    end rad;


    N: Integer;
    F : Float;
    C : Character;

begin

    Put("Mata in ett flyttal: ");
    Get(F);
    Put("Mata in ett tecken: ");
    Get(C);
    Put("Den beräknade kvoten mellan ");
    Put(F, Fore => 0, Aft => 1, Exp => 0);
    Put(" och ");
    Put(C);
    Put(" blir ");
    Put((F/C), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in längden: ");
    Get(N);
    Put("Den beräknade arean blev: ");
    rad(N);
    Put(N, Width => 1);
    New_Line(2);
    Skip_Line;

end p2_0;
