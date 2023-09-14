--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;

procedure o1_2 is

    Fp, Sp, Steg, Mp, Pris, Moms    : Float;
    F                         : Float;
    N                         : Integer;

begin
    loop
        Put("Första pris: ");
        Get(Fp);
        Skip_Line;
        exit when Fp >= 0.0;
        Put_Line("Felaktigt värde!");
    end loop; 

    --  Put("Första pris: ");
    --  Get(Fp);
    --  while Fp < 0.0 loop
    --      Put_Line("Felaktigt värde!");
    --      Put("Första pris: ");
    --      Get(Fp);
    --  end loop;

    loop
        Put("Sista pris: ");
        Get(Sp);
        Skip_Line;
        exit when Sp > 0.0 and Sp >= Fp;
        Put_Line("Felaktigt värde!");
    end loop;

    loop
        Put("Steg: ");
        Get(Steg);
        Skip_Line;
        exit when Steg > 0.0;
        Put_Line("Felaktigt värde!");
    end loop;

    loop
        Put("Momsprocent: ");
        Get(Moms);
        Skip_Line;
        exit when Moms >= 0.0 and Moms <= 100.0;
        Put_Line("Felaktigt värde!");
    end loop;

    New_Line;
    Put_Line ("============ Momstabell ============");
    Put_Line ("Pris utan moms  Moms   Pris med moms");

    F := (Sp - Fp) / Steg;
    F := Float'Floor (F);
    N := Integer(F);
--    if N <1 then
--        N := 1;
--    end if;
    pris := Fp;

    for Row in 1 .. N+1 loop

        Mp := (Pris  * Moms) / 100.0;
        Put(Pris, Fore => 6, Aft => 2, Exp => 0);
        Put("   ");
        Put(Mp, Fore => 5, Aft => 2, Exp => 0);
        Put("   ");
        Put(Mp + Pris, Fore => 6, Aft => 2, Exp => 0);
        
        New_Line;
        Pris := (Pris + Steg);

    end loop;

end o1_2;

