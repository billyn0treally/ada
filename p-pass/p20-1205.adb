with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure p20 is

    procedure mul (S : in out String; N : in out Integer ; Result : out Float) is
    begin
    Put("Mata in en sträng med exakt 3 tecken: ");
    Get(S);
    Put("Mata in ett heltal: ");
    Get(N);
    Result := Float'Rounding(Float'Value(S) * Float(N)) ;
    end mul;

    function "=" (F1 : in Float ; N : in Integer) return Boolean is
    begin
        if F1 = Float(N) then 
            return True;
        else
            return False;
        end if;
    end "=";

    function medel (F1, F2, F3 : in Float) return Float is
    begin
        return Float'Rounding((F1 + F2 + F3) / 3.0);
    end medel;

    S : String(1..3);
    N : Integer;
    F1, F2, F3 : Float;
    Result : Float;

begin

    mul(S, N, Result);
    Put("Du matade in strängen: ");
    Put(S); 
    Put(" och heltalet: ");
    Put(N, Width => 0);
    Put(" och produkten blev ");
    Put(Result);
    New_Line(2);
    Skip_Line;

    Put("Mata in ett flyttal: ");
    Get(F1);
    Put("Mata in ett heltal: ");
    Get(N);
    if F1 = N then
        Put("Det inmatade flyttalet är lika med heltalet.");
    else
        Put("Det inmatade flyttalet är inte lika med heltalet.");
    end if;
    New_Line(2);
    Skip_Line;

    Put ("Mata in tre flyttal: ");
    Get (F1);
    Get (F2);
    Get (F3);
    Put ("Medelvärdet av dessa är: ");
    Put (medel (F1, F2, F3), Fore => 0, Aft => 1, Exp => 0);
    Skip_Line;

end p20;
