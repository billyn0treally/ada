with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions;    use Ada.Numerics.Elementary_Functions; 

procedure main is

    procedure triangle ( S : in Integer ; N : out Integer) is 
    begin
        N := Integer(Float'Ceiling(FLoat(S) * (Float(S) * Sqrt(3.0) / 2.0) / 2.0));
    end triangle;

    function "-" (N : in Integer ; Str : in String ) return Float is
    begin
        return Float'Ceiling(Float(N) - Float'Value(Str));
    end "-";

    procedure print ( N : in Integer ; X : in String) is
    begin
        Result := X * N;
        --Str(I .. I + 5) := ;
    end print;

    S, N : Integer;
    Str : String(1..3);
    Len : Integer;
    X : String(1 .. N * Len);
    Result : String(1 .. N * Len);

begin

    Put("Mata in längden: ");
    Get(S);
    triangle(S, N);
    Put("Den beräknade arean blev: ");
    Put(N, Width => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in ett heltal: ");
    Get(N);
    Put("Mata in en sträng: ");
    Get(Str);
    Put("Den beräknade differensen mellan ");
    Put(N, Width => 1);
    Put(" och ");
    Put(Str);
    Put(" blir ");
    Put((N-Str), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Mata in ett heltal: ");
    Get(N);
    Put("Mata in en sträng: ");
    Get(X);
    print(N, X);
    Put("Den resulterade strängen blir: ");
    Put(Result);

end main;
