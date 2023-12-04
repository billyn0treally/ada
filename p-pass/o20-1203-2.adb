with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions;    use Ada.Numerics.Elementary_Functions; 

procedure main is

    function "-" (F : in Float ; Str : in String ) return Float is
    begin
        return Float'Floor(F - Float'Value(Str));
    end "-";

    procedure triangle ( S : in Character ; N : out Integer) is 
        tmp : Float := Float(Character'Pos(S) - Character'Pos('0'));
    begin
        N := Integer(Float'Rounding(tmp * (tmp * Sqrt(3.0) / 2.0) / 2.0));
        --S * (S * Sqrt(3.0) / 2.0) / 2.0
    end triangle;

    procedure diff (N : in out Integer ; Str : in out String ; Result : out Integer ) is
    begin
    Put("Mata in ett heltal: ");
    Get(N);
    Put("Mata in en sträng: ");
    Get(Str);
    Result := Integer(Float'Rounding(Float(N) - Float'value(Str)));
    end diff;

    Str         : String(1..3);
    S           : Character;
    N, Result   : Integer;
    F           : Float;

begin

    Put("Mata in ett flyttal: ");
    Get(F);
    Put("Mata in en sträng: ");
    Get(Str);
    Put("Den beräknade differensen mellan ");
    Put(F, Fore => 0, Aft => 1, Exp => 0);
    Put(" och ");
    Put(Str);
    Put(" blir ");
    Put((F-Str), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in längden: ");
    Get(S);
    triangle(S, N);
    Put("Den beräknade arean blev: ");
    Put(N, Width => 0);
    New_Line(2);

    diff(N, Str, Result);
    Put("Du matade in heltalet: ");
    Put(N, Width => 0);
    Put(" och strängen: ");
    Put(S);
    Put(" och differensen blev ");
    Put(Result);
    Skip_Line;

end main;
