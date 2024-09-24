with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
--with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure p2_0 is

    --Tecken och heltal
    --function diff (Ch : in Character; I : in Integer) return Integer is
    --    X : String(1..1);
    --begin
    --    X := Character'Image(Ch);
    --    return Integer'Value(X) - I;
    --end diff;

    function jamfor (F1, F2 : in Float) return FLoat is
    begin
        if F1 >= F1 then
            return Float(Integer(F1));
        else
            return Float(Integer(F2));
        end if;
        end jamfor;


    function div (Ch : in Character; I : in Integer) return Float is
        --X : String(1..1);
    begin
        --X := Character'Image(Ch);
        --return FLoat(Integer'Value(X) / I);
        return FLoat(Integer'Value(Character'Image(Ch)) / I);
    end div;

    --function medel (F1, F2, F3 : in Float) return Integer is
    --    Ftot : Float;
    --begin
    --    Ftot := (F1 + F2 + F3) / 3.0;
    --    return Integer(Ftot + 0.5);
    --end medel;

    --procedure medel (F1, F2, F3 : Float; I : out Integer) is
    --begin
    --    Medel := Integer((F1 + F2 + F3) / 3.0 + 0.5);
    --end Medel;

    -- Summa
    function "+" (S : in String; F1 : in Float) return Float is
    begin
        return (Float'Value(S) + F1);
    end "+";

    -- Huvudprogram
    Ch  : Character;
    S   : String(1..3);
    I   : Integer;
    F1, F2, F3 : Float;

begin

    Put("Mata in två flyttal: ");
    Get(F1);
    Get(F2);
    Put("Det största värdet av dessa är: ");
    Put(jamfor(F1,F2), Fore => 0, Aft => 2, Exp=>0);
    New_Line;
    Skip_Line;


    Put("Mata in ett heltal: ");
    Get(I);
    Put("Mata in ett tecken: ");
    Get(Ch);
    New_Line;
    Put("Den beräknade kvoten mellan ");
    Put(I, Width => 1);
    Put(" och ");
    Put(Ch);
    Put(" blir");
    Put(div(Ch, I));
    Skip_Line;

   -- Put("Mata in ett tecken: ");
   -- Get(Ch);
   -- Put("Mata in ett heltal: ");
   -- Get(I);
   -- Put("Den beräknade differensen mellan ");
   -- Put(Ch);
   -- Put(" och ");
   -- Put(I, Width => 1);
   -- Put(" blir");
   -- Put(diff(Ch, I));
   -- Skip_Line;
   -- New_Line(2);

--    Put("Mata in tre flyttal: ");
--    Get(F1);
--    Get(F2);
--    Get(F3);
--    Put("Medelvärdet av dessa är: ");
--    Put(medel(F1, F2, F3), Width => 1);
--    Skip_Line;
--    New_Line(2);
--
--    Put("Mata in en sträng med exakt 3 tecken: ");
--    Get(S);
--    Put("Mata in ett flyttal: ");
--    Get(F1);
--    Put("Du matade in strängen: ");
--    Put(S);
--    Put(" och flyttalet: ");
--    Put(F1,Fore => 0, Aft => 1, Exp => 0);
--    Put(" och summan blev ");
--    Put(S + F1, Fore => 0, Aft => 1, Exp => 0);
--    Skip_Line;

end p2_0;
