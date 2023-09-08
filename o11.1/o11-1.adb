with Ada.Text_Io;                          use Ada.Text_Io;
with Ada.Integer_Text_Io;                  use Ada.Integer_Text_Io;
with Ada.Float_Text_Io;                    use Ada.Float_Text_Io;
with Ada.Numerics;                         use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;    use Ada.Numerics.Elementary_Functions; 

procedure o11 is

    --- Factorial Section ---
    function Calculate_Factorial (N : Integer) return Integer is
        Factorial : Integer := 1;
    begin
        for I in reverse 1..N loop
            Factorial := Factorial*I;
        end loop;
        return Factorial;
    end Calculate_Factorial;

    procedure Factorial_Program is
        N : Integer;
    begin
        Put("Mata in N: ");
        Get(N);
        Put(N,0);
        Put("-fakultet = ");
        Put(Calculate_Factorial(N), 1);
    end Factorial_Program;




    --- Menu Selection ---
    procedure Menu_Selection  (Selection : out Integer) is
    begin
      Put_Line("=== HUVUDMENY ===");
      Put_Line("1. Beräkna hypotenusa");
      Put_Line("2. Beräkna triangelvinklar");
      Put_Line("3. Beräkna N-fakultet");
      Put_Line("4. Avsluta programmet");
      loop
          Put("Val: ");
          Get(Selection);
          if Selection <= 0 or Selection >= 5 then
              Put("Felaktigt val!");
          else
              exit;
          end if;
      end loop;
    end Menu_Selection;


    --- Huvudprogram ---

    Selection : Integer;

begin
    Put_Line ("Välkkommen till miniräknaren");
    loop
        Menu_Selection (Selection);

        if Selection = 1 then
            Hypothenuse_Program;
            New_Line;

        elsif Selection = 2 then
            Angle_Program;
            New_Line; 

        elsif Selection = 3 then
            Factorial_Program;
            New_Line;

        elsif Selection = 4 then
            Put("Ha en bra dag!");
            New_Line;
            exit;
        end if;

        New_Line;

    end loop;

end o11;
