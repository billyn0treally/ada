with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure p2_0 is

    --Tecken och heltal
    function diff (Ch : in Character; I : in Integer) return Integer is
        X : String(1..1);
    begin
        X := Character'Image(Ch);
        return Integer'Value(X) - I;
    end diff;

    -- Medelvärde
    function medel (F1, F2, F3 : in Float) return Integer is
        Y : Integer;
        Ftot : Float;
    begin
        Ftot := Float'Floor(F1+F2+F3);
        Y := Integer(Ftot);
        return Y/3;
    end medel;

    -- Summa
    function sum (S : in String; F1 : in Float) return Float is
    begin
        return (Float'Value(S) + F1);
    end sum;

    -- Huvudprogram
    Ch  : Character;
    S   : String(1..3);
    I   : Integer;
    F1, F2, F3 : Float;

begin

    Put("Mata in ett tecken: ");
    Get(Ch);
    Put("Mata in ett heltal: ");
    Get(I);
    Put("Den beräknade differensen mellan ");
    Put(Ch);
    Put(" och ");
    Put(I, Width => 1);
    Put(" blir");
    Put(diff(Ch, I));
    Skip_Line;
    New_Line(2);

    Put("Mata in tre flyttal: ");
    Get(F1);
    Get(F2);
    Get(F3);
    Put("Medelvärdet av dessa är: ");
    Put(medel(F1, F2, F3));
    Skip_Line;
    New_Line(2);

    Put("Mata in en sträng med exakt 3 tecken: ");
    Get(S);
    Put("Mata in ett flyttal: ");
    Get(F1);
    Put("Du matade in strängen: ");
    Put(S);
    Put(" och flyttalet: ");
    Put(F1,Fore => 0, Aft => 1, Exp => 0);
    Put(" och summan blev ");
    Put(sum(S, F1));
    Skip_Line;

end p2_0;
