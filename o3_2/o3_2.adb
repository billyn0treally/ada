--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

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
        
    type Array_Type_3_N is
        Array(crange2) of Integer;

    type Array_Type_3 is 
        array(Integer(73..74)) of Array_Type_3_N;
        
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
        Skip_Line;
    end Get;

    -- Put DS1
    procedure Put(DS1 : in Array_Type_1) is
    begin
        for I in reverse DS1'First..DS1'Last loop
            Put(" ");
            Put(DS1(I),0,3,0);
        end loop;
        New_Line(2);
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
    procedure Get(DS3 : out Array_Type_3) is
        C : Character;
        Temp_Str : String(1..5);
    begin
        for I in crange2 loop
            for J in reverse Integer loop
                Get(Temp_Str);
                DS3(I)(J) := Temp_Str;
                if J = crange2'First and I = Integer'Last then
                    exit;
                end if;
                Get(C);
            end loop;
        end loop;
    end Get;

    procedure Put(DS3 : in Array_Type_3) is
    begin
        for I in crange2 loop
            for J in reverse Integer loop
                Put(" ");
                Put(DS3(I)(J));
            end loop;
        end loop;
    end Put;
                -- Main program

begin

    Put("För DS1:");
    New_Line;
    Put("Mata in datamängd: ");
    Get(DS1);
    Put("Inmatad datamängd: ");
    Put(DS1);

    Put("För DS2:");
    New_Line;
    Put("Mata in datamängd: ");
    Get(DS2);
    Put("Inmatad datamängd: ");
    Put(DS2);

    --    Put("För DS3:");
    --    New_Line;
    --    Put("Mata in datamängd: ");
    --    Get(DS3);
    --    Put("Inmatad datamängd: ");
    --    Put(DS3);

end o3_2;
