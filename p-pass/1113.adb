with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p2 is

    function "/" (S : in String ; N : in Integer) return Integer is
        kvot : Integer;
    begin
        kvot := Integer'Value(S)/N;
        return kvot;
    end "/";

    function add (N : in Integer) return Integer is
    begin
        N := N + 32.7;
        Put(N);
    end add;

    S : String(1..3);
    N : Integer;

begin
    Put("Mata in en sträng: ");
    Get(S);
    Put("Mata in ett heltal: ");
    Get(N);
    Put("Den beräknade kvoten mellan ");
    Put(S);
    Put(" och ");
    Put(N, Width => 1);
    Put(" blir ");
    Put((S/N), Width => 1);
    New_Line(2);
    Skip_Line;

    Put("Mata in ett heltal: ");
    Get(N);
    Put("summan av ");
    Put(N, Width => 1);
    Put(" och 32.7 blir ");
    Put(add(N));

end p2;
