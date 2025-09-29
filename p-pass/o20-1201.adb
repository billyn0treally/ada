with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure o20 is

    procedure sum (N1 : in out Integer ; N2 : in out Float ; Result : out Float ) is
    begin
    Put("Mata in ett heltal: ");
    Get(N);
    Put("Mata in ett heltal: ");
    Get(F);
    Result := Float(N) + F;
    end sum;

    function "/" (C : in Character ; F1 : in Float) return Integer is
    begin
        return Integer(Float'Ceiling(FLoat((Character'Pos(C)-Character'Pos('0'))) / F1));
    end "/";

    procedure radie (F1 : in Float ; F2 : out Float) is
    begin
        F2 := Float'Floor(F1 * F1 * 3.14);
    end radie;

    function cat (N1, N2 : in Integer) return String is
    begin
        return Integer'Image(N1) & Integer'Image(N2);
    end cat;

    S : String(1..3);
    N : Integer;
    --N1, N2 : Integer;
    N1, N2 : Integer range 10 .. 99;
    --F : Float;
    F1, F2, F3 : Float;
    C : Character;
    Result : Float;

begin

    Put("Mata in ett tecken: ");
    Get(C);
    Put("Mata in ett flyttal: ");
    Get(F1);
    Put("Den beräknade kvoten mellan ");
    Put(C);
    Put(" och ");
    Put(F1, Fore => 0, Aft => 1, Exp => 0);
    Put(" blir ");
    Put(C/F1, Width => 0); -- Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in längden: ");
    Get(F1);
    Put("Den beräknade arean blev: ");
    radie(F1, F2);
    Put(F2, Fore => 0, Aft => 1, Exp => 0);
    --Put(radie(F1, F2)); --, Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in N1: ");
    Get(N1);
    Put("Mata in N2: ");
    Get(N2);
    Put(cat(N1, N2));

end o20;
