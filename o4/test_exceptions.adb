--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
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
        Y, M, D : Integer;
    end record;

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

    -- Entertecken ska ignoreras när de kommer innan strängen
    procedure Get_Correct_String (S : out String) is
        C : Character;
    begin
        loop
            Get (C);
            if not (C = ' ' or End_Of_Line) then
                exit;
            end if;
        end loop;
        S(S'First) := C;
       -- Get (C);
       -- if End_Of_Line then
       --     raise Length_Error;
       -- end if;
       -- S (S'First + 1) := C;
       -- if End_Of_Line then
       --     raise Length_Error;
       -- end if;
        for I in 1 .. S'Last loop
            Get(C);
            S(S'First+I) := C;
            exit when C = S(S'Last);
            if End_Of_Line then --or C < S(S'Last) 
                raise Length_Error;
            end if;
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

    -- Kollar om det är skottår eller inte
    function IsLeap (N : in Integer) return Boolean is
--        Leap : Boolean;
    begin
        if (N mod 4 = 0 and N mod 100 /= 0) or (N mod 400 = 0) then
            return True;
        else
            return False;
        end if;
--
--        if (N mod 4) = 0 then
--            Leap := False;
--            if (N mod 100) = 0 then
--                Leap := True;
--                if (N mod 400) = 0 then
--                    Leap := False;
--                end if;
--            end if;
--        end if;
--        return Leap;
    end IsLeap;

    -- String length errorn kommer från Get_Correct_String
    procedure Get (Item : out Date_Type) is
        S : String (1 .. 10);
    begin
        Get_Correct_String (S);

        if S (5) /= '-' or S (8) /= '-' or S'Length /= 10 then
            raise Format_Error;
        end if;

        for I in 1 .. 4 loop
            if S (I) < '0' or S (I) > '9' then
                raise Format_Error;
            end if;
        end loop;

        for I in 1 .. 2 loop
            if S (I + 5) < '0' or S (I + 5) > '9' then
                raise Format_Error;
            elsif S (I + 8) < '0' or S (I + 8) > '9' then
                raise Format_Error;
            end if;
        end loop;

        Item.Y := Integer'Value (S (1 .. 4));
        Item.M := Integer'Value (S (6 .. 7));
        Item.D := Integer'Value (S (9 .. 10));

        if (Item.Y > 9_000 or Item.Y < 1_532) then
            raise Year_Error;

        elsif (Item.M = 00 or Item.M > 12) then
            raise Month_Error;

        elsif Item.D > 31 or Item.D = 0 then
            raise Day_Error;

        elsif Item.D = 31 and
            (Item.M = 4 or Item.M = 6 or Item.M = 9 or Item.M = 11)
        then
            raise Day_Error;

        elsif Item.D > 29 and Item.M = 2 then
            raise Day_Error;

        elsif Item.D = 29 and Item.M = 2 and IsLeap (Item.Y) = False then
            raise Day_Error;
        end if;
    end Get;

    procedure Put (Item : in Date_Type) is
    begin
        Put (Item.Y, Width => 1);
        Put ("-");
        if Item.M <= 9 then
            Put ("0");
        end if;
        Put (Item.M, Width => 1);
        Put ("-");
        if Item.D <= 9 then
            Put ("0");
        end if;
        Put (Item.D, Width => 1);
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
            begin
                Upg2 (Length);
            exception
                when Length_Error =>
                    Put ("För få inmatade tecken!");
                    New_Line;
                    exit;
            end;

        elsif Choice = 3 then
            loop
                begin
                    Upg3;
                    exit;
                exception
                    when Length_Error =>
                        Put ("Felaktigt format! ");
                    when Format_Error =>
                        Put ("Felaktigt format! ");
                    when Year_Error   =>
                        Put ("Felaktigt år! ");
                    when Month_Error  =>
                        Put ("Felaktig månad! ");
                    when Day_Error    =>
                        Put ("Felaktig dag! ");
                end;
            end loop;

        else
            Put_Line ("Programmet avslutas.");
            exit;
        end if;
    end loop;
end Test_Exceptions;
