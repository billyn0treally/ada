--mikna021: Samarbetat med melg374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Exceptions;      use Ada.Exceptions;

procedure Test_Exceptions is

    ----------------------------------------------------------------------
    -- Underprogram får att skriva ut meny och hantera menyval          --
    --                                                                  --
    -- Underprogrammet skriver ut de menyval som finns tillgängliga.    --
    -- Användaren får mata in menyval tills denne matat in ett          --
    -- korrekt menyval.                                                 --
    ----------------------------------------------------------------------
    function Menu_Selection return Integer is

        N : Integer;

    begin
        Put_Line ("1. Felkontrollerad heltalsinläsning");
        Put_Line ("2. Längdkontrollerad stränginläsning");
        Put_Line ("3. Felkontrollerad datuminläsning");
        Put_Line ("4. Avsluta programmet");

        loop
            Put ("Mata in N: ");
            Get (N);
            exit when N in 1 .. 4;
            Put_Line ("Felaktigt N, mata in igen!");
        end loop;

        return N;
    end Menu_Selection;

    type Date_Type is record
        D, M, Y : Integer;
    end record;

    -- Helper strings, probably should not be global
    S_1 : String (1 .. 5);
    S_2 : String (2 .. 7);
    S_3 : String (1 .. 10);

    Length_Error, Format_Error, Year_Error, Month_Error, Day_Error : exception;

    ----------------------------------------------------------------------
    -- Underprogram får menyval 1: "felhantering av heltalsinmatning"   --
    --                                                                  --
    -- Underprogrammet låter användaren mata in ett intervall angivet   --
    -- med två heltal Min och Max. Get_Safe anropas                     --
    -- sedan med detta intervall och sköter felhanteringen av           --
    -- heltalsinläsningen där användaren får mata in värden tills       --
    -- korrekt värde matas in.                                          --
    ----------------------------------------------------------------------
    Value, Min, Max : Integer;

    --   exception
    --       when Data_Error =>
    --           Put("Fel datatyp. Mata in värde ("& Min'Image &" -" & Max'Image &"): ");

    -- Det finns en extra whitespace före Integern vi printar ut
    -- men bara om Integern är positiv. Så den tar - tecknets plats
    procedure Get_Safe (Value : out Integer; Min, Max : in Integer) is
    begin
        Put ("Mata in värde (");
        Put (Min, Width => 0);
        Put (" -" & Max'Image & "): ");
        loop
            begin
                Get (Value);
                exit when Min <= Value and Value <= Max;
                if Min >= Value then
                    Put ("För litet värde. Mata in värde (");
                    Put (Min, Width => 0);
                    Put (" -" & Max'Image & "): ");
                elsif Max <= Value then
                    Put ("För stort värde. Mata in värde (");
                    Put (Min, Width => 0);
                    Put (" -" & Max'Image & "): ");
                end if;
            exception
                when Data_Error =>
                    Put ("Fel datatyp. Mata in värde (");
                    Put (Min, Width => 0);
                    Put (" -" & Max'Image & "): ");
                    Skip_Line;
            end;
        end loop;
    end Get_Safe;

    procedure Upg1 is

    begin
        Put ("Mata in Min och Max: ");
        Get (Min);
        Get (Max);

        Get_Safe (Value, Min, Max);
        Skip_Line;

        Put ("Du matade in heltalet ");
        Put (Value, Width => 0);
        Put_Line (".");
    end Upg1;

    ----------------------------------------------------------------------
    -- Underprogram får menyval 2: "felhantering av stränginmatning"    --
    --                                                                  --
    -- Underprogrammet skapar en sträng som är lika lång som parametern --
    -- Length. Underprogrammet skickar denna sträng till                --
    -- Get_Correct_String där felhanteringen av stränginmatningen sker. --
    -- Om användaren matar in en får kort strÃ¤ng kommer                 --
    -- Get_Correct_String kasta/resa undantag vilket inte ska           --
    -- fångas här utan i huvudprogrammet.                               --
    ----------------------------------------------------------------------

    procedure Get_Correct_String (S : out String) is
        C     : Character;
        Index : Integer := 0;
        EOL   : Boolean := False;
    begin
        loop
            if EOL then
                raise Length_Error;
            end if;
            Get (C);
            if Index = 0 and C = ' ' then
                Index := 0;
            elsif Index <= S'Length then
                S (S'First + Index) := C;
                Index               := Index + 1;
            end if;
            if Index >= S'Length then
                exit;
            end if;
            Look_Ahead (C, EOL);
        end loop;
    end Get_Correct_String;

    procedure Upg2 (Length : in Integer) is

        S : String (1 .. Length);

    begin
        Put ("Mata in en sträng med exakt ");
        Put (Length, Width => 0);
        Put (" tecken: ");

        Get_Correct_String (S);
        Skip_Line;

        Put_Line ("Du matade in strängen " & S & ".");
    end Upg2;

    ----------------------------------------------------------------------
    -- Underprogram får menyval 3: "felhantering av datuminmatning"     --
    --                                                                  --
    -- Underprogrammet anropar Get som i sin tur kommer läsa in och     --
    -- kontrollera ett datums format och rimlighet. Om datumet är       --
    -- felaktigt kommer Get kasta/resa undantag vilket detta            --
    -- underprogram ska fånga, skriva ut felmeddelande får och sedan    --
    -- anropa Get igen.                                                 --
    ----------------------------------------------------------------------

    procedure Get (Item : out Date_Type) is
        Bound : Integer := 30;
        Month : Integer;
        Year  : Integer;
    begin
        Get_Correct_String (S_3);
        if S_3 (5) /= '-' or S_3 (8) /= '-' then
            raise Format_Error;
        end if;
        Month := Integer'Value (S_3 (6 .. 7));

        if (Month = 0 or Month > 12) then
            raise Month_Error;
        elsif Month mod 2 = 0 then
            Bound := Bound + 1;
        end if;
        if (Year mod 4 = 0) and ((Year mod 100 /= 0) or (Year mod 400 = 0))
        then
            Bound := 29;
        else
            Bound := 28;
        end if;
        if Integer'Value (S_3 (9 .. 10)) > Bound then
            raise Day_Error;
        end if;
        Year := Integer'Value (S_3 (1 .. 4));
        if (Year > 9_000 or Year < 1_532) then
            raise Year_Error;
        end if;
    end Get;

    procedure Put (Item : in Date_Type) is
    begin
        Put (S_3);
    end Put;

    procedure Upg3 is

        Date : Date_Type;

    begin
        Put ("Mata in ett datum: ");
        Get (Date);
        Skip_Line;

        Put ("Du matade in ");
        Put (Date);
        New_Line;
    end Upg3;

    ----------------------------------------------------------------------
    -- Huvudprogram                                                     --
    --                                                                  --
    -- Huvudprogrammet skriver ut och låter användaren välja val i en   --
    -- meny via underprogrammet Menu_Selection. Beroende på vilket      --
    -- menyval användaren valt kommer olika underprogram anropas.       --
    -- Observera att får menyval 2 kommer användaren få mata in längden --
    -- av en sträng vilket skickas vidare till underporgrammet Upg2 där --
    -- strängen i sig skapas.                                           --
    ----------------------------------------------------------------------
    Choice, Length : Integer;

begin
    loop
        Choice := Menu_Selection;

        if Choice = 1 then
            Upg1;

        elsif Choice = 2 then
            Put ("Mata in en stränglängd: ");
            Get (Length);
            Skip_Line;
            --begin
            Put ("deez");
            -- Upg2(Length);
            -- exception
            --     when Length_Error =>
            --         Put("För få inmatade tecken!");
            --         New_Line;
            -- end;

        elsif Choice = 3 then
            Upg3;
            --Put("Segmentation fault (core dumped)"); -- så det kompilerar
            --New_Line;

        else
            Put_Line ("Programmet avslutas.");
            exit;
        end if;
    end loop;
end Test_Exceptions;
