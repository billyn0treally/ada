--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure o2 is
    I       : Integer;
    F       : Float;
    S       : String (1 .. 5);
    Bool    : Boolean;
    Char    : Character;

   function "-" (A : Integer; B : Float) return Float is
    begin
        return Float(A) - B;
    end "-";

--gamla koden nedan, bytes ut av TestString

    --  procedure strlenxd ( S : in out String; B : out Boolean ) is
    --      Local_S : String(1 .. S'Length + 1);
    --  begin
    --      if S (S'Last) = 's' then
    --          B := True;
    --      else
    --          B           := False;
    --          S (S'Last)  := 's';
    --          Local_S     := S & 's';
    --      end if;
    --  end strlenxd;

    procedure TestString ( S : in out String; B : out Boolean) is 
    begin
        if S(S'last) = 's' then 
            B := True;
        else
            B := False; 
            S(S'last) := 's';
        end if;
        
    end TestString;

    function iss (C : Character) return Boolean is
    begin
        return C = 'S' or C = 's';
    end iss;

begin
    Put("Mata in ett heltal och ett flyttal: ");
    Get(I);
    Get(F);
    Put("Differensen mellan dem är ");
    Put(I-F, Fore =>  0, Aft => 2, Exp => 0);
    Skip_Line;
    New_Line (2);

    Put("Skriv in ett 5 tecken långt engelskt substantiv: ");
    Get(S);
    TestString (S, Bool);
    Put("Ordet ");
    Put(S);
    if Bool then
        Put(" var troligtvis i plural från början");
    else
        Put(" var troligtvis inte i plural från början");
    end if;
    New_Line (2);
Skip_Line;
    Put("Mata in ett tecken: ");
    Get(Char);
    if iss (Char) then
        Put("Tecknet var sant") ;
    else 
        Put("Tecknet var inte sant");
    end if;

end o2;
