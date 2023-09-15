--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;		        use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;         use Ada.Float_Text_IO;

procedure recursion is

-- Del 1
   
    function Fib (N : in Integer) return Integer is
    begin
        if N = 0 then
            return 0;
        elsif N = 1 then
            return 1;
        else return Fib(N-1) + Fib(N-2);
    end if;
end Fib;

-- Del 2

function Pyramid(H : in Integer) return Integer is
    Tmp : Integer;
begin
    if H = 0 then
        return 0;
    elsif H = 1 then
        return 1;
    end if;

    tmp := 2 * (H-2) + 3;
    return H * tmp + Pyramid(H-1);
end Pyramid;

-- Del 3

N, H : Integer;

begin
    Put("Mata in N och H: ");
    Get(N);
    Get(H);
    Put("Fibonacci-tal nummer ");
    Put(N, Width => 0);
    Put(" är ");
    Put(Fib(N), Width => 0);
    Put(".");
    New_Line;

    Put("Det behövs ");
    Put(Pyramid(H-1), Width => 1);
    Put(" stenar för att bygga trappan.");

end recursion;
