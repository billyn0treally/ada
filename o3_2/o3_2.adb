--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

--Viktigt för uppgiften:

--  Saknar specificerare för Put för heltal eller flyttal

--  Ordning av kodens olika delar

--  Mellanlagring av delar av din datatyp

--  Skapa en Get/Put för varje datatyp, även inre

--Tips:

--  Placering av Skip_Line

--  Några enstaka indenteringsfel

procedure o3_2 is

    -- Type Declaration

    type Array_Type_1 is
        array (31..35) of Float;

    subtype crange is Character range '5'..'9';

    type Array_Type_2_N is
        array (crange) of String(1..5);

    type Array_Type_2 is
        array(Boolean) of Array_Type_2_N; 

    subtype crange2 is Character range '4'..'8';

    type Array_Type_3 is 
        array(73..74,crange2) of Integer;
        
        DS1 : Array_Type_1;
        DS2 : Array_Type_2;
        DS3 : Array_Type_3;

        -- Procedures

        -- Get DS1
    procedure Get(DS1 : out Array_Type_1) is
    begin
        for I in reverse DS1'First..DS1'Last loop
            Get(DS1(I));
        end loop;
    end Get;

    -- Put DS1
    procedure Put(DS1 : in Array_Type_1) is
    begin
        for I in reverse DS1'First..DS1'Last loop
            Put(" ");
            Put(DS1(I),0,3,0);
        end loop;
    end Put;

    -- Get DS2
    procedure Get(DS2 : out Array_Type_2) is
        C : Character;
        Temp_Str : String(1..5);
    begin
        for I in Boolean loop
            for J in reverse crange loop
                Get(Temp_Str);
                DS2(I)(J) := Temp_Str;
                if J = crange'First and I = Boolean'Last then
                    exit;
                end if;
                Get(C);
            end loop;
        end loop;
    end Get;

    -- Put DS2
    procedure Put(DS2 : in Array_Type_2) is
    begin
        for I in Boolean loop
            for J in reverse crange loop
                Put(" ");
                Put(DS2(I)(J));
            end loop;
        end loop;
    end Put;

    -- Get DS3
    procedure Get (DS3 : out Array_Type_3) is
    begin
        for I in  DS3'first..DS3'last loop
            for J in  crange2 loop
                Get(DS3(I,J));
            end loop;
        end loop;
    end Get;

    -- Put DS3
    procedure Put (DS3 : in Array_Type_3) is  
    begin                          
        for I in DS3'first..DS3'last loop
            for J in crange2 loop
                Put(" ");
                Put(DS3(I,J),Width  => 1);
            end loop;
        end loop;
    end Put;

                -- Main program

begin   

    Put_Line("För DS1:");
    Put("Mata in datamängd: ");
    Get(DS1);
    Put("Inmatad datamängd:");
    Put(DS1);
    New_Line (2);
    Skip_Line;

    Put_Line("För DS2:");
    Put("Mata in datamängd: ");
    Get(DS2);
    Put("Inmatad datamängd:");
    Put(DS2);
    New_Line (2);
    Skip_Line;

    Put_Line("För DS3:");
    Put("Mata in datamängd: ");
    Get(DS3);
    Put("Inmatad datamängd:");
    Put(DS3);
    Skip_Line;

end o3_2;
