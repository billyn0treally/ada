with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;

procedure o1_2 is

    Fp, Sp, Steg, Mp, Pris, Moms    : Float;
    F                         : Float;
    N                         : Integer;

begin
    Put("Första pris: ");
    Get(Fp);
    while Fp < 0.0 loop
        Put_Line("Felaktigt värde!");
        Put("Första pris: ");
        Get(Fp);
    end loop;

    Put("Sista pris: ");
    Get(Sp);
    while Sp < 0.0  or Sp < Fp loop
        Put_Line("Felaktigt värde!");
        Put("Sista pris: ");
        Get(Sp);
    end loop;

    Put("Steg: ");
    Get(Steg);
    while Steg <= 0.0 loop
        Put_Line("Felaktigt värde!");
        Put("Steg: ");
        Get(Steg);
    end loop;

    Put("Momsprocent: ");
    Get(Moms);
    while Moms < 0.0 or Moms > 100.0 loop
        Put_Line("Felaktigt värde!");
        Put("Momsprocent: ");
        Get(Moms);
    end loop;

    New_Line;
    Put_Line ("============ Momstabell ============");
    Put_Line ("Pris utan moms  Moms   Pris med moms");

    F := (Sp - Fp) / Steg;
    F := Float'Floor (F);
    N := Integer (F);
    pris := Fp;

    for Row in 1 .. N loop

        Mp := (Pris  * Moms) / 100.0;
        Put(Pris, Fore => 6, Aft => 2, Exp => 0);
        Put("   ");
        Put(Mp, Fore => 6, Aft => 2, Exp => 0);
        Put("   ");
        Put(Mp + Pris, Fore => 6, Aft => 2, Exp => 0);
        

        New_Line;
        Pris := (Pris + Steg);


    end loop;

end o1_2;

