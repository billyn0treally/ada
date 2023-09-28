-- mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

--  Skapa en Get/Put för varje datatyp, även inre
procedure o3_1 is

    -- Deklarera posterna

    type Post_Type1 is record
        W : Character;
        P : String(1 .. 4);
    end record;

    type Post_Type2_N is record
        S : Float;
        Z : String(1 .. 4);
    end record;
    type Post_Type2 is record
        D, U : Post_Type2_N;
    end record;

    type Post_Type3_N_1 is record
        Y, Q : Character;
    end record;

    type Post_Type3_N_2 is record
        L : Character;
        T : Boolean;
    end record;

    type Post_Type3 is record
        J, B     : Post_Type3_N_1;
        O        : Post_Type3_N_2;
    end record;

    -- Procedures

    procedure whitespace is
    begin Put(" ");
    end whitespace;

    -- Get för  Post_Type_1
    procedure Get(DS1: out Post_Type1) is
        Ch : Character;
    begin
        Get(DS1.W);
        Get(Ch);
        Get(DS1.P);
    end Get;

    -- Get för Post_Type2_N
    procedure Get(PT2 : out Post_Type2_N) is
        Ch : Character;
    begin
        Get(PT2.S);
        Get(Ch);
        Get(PT2.Z);
    end Get;

    -- Get för  Post_Type_2
    procedure Get(DS2: out Post_Type2) is
        Ch : Character;
    begin
        Get(DS2.D);
        Get(Ch);
        Get(DS2.U);
    end Get;

    -- Get för Post_Type3_N_1
    procedure Get(DS3 : out Post_Type3_N_1) is
        Ch : Character;
    begin
        Get(DS3.Y);
        Get(Ch);
        Get(DS3.Q);
    end Get;

    -- Get för Post_Type3_N_2
    procedure Get(DS3 : out Post_Type3_N_2) is
        Ch : Character;
    begin
        Get(Ch);
        DS3.T := Ch = 'T';
        Get(Ch);
        Get(DS3.L);
    end Get;

    -- Get för  Post_Type_3
    procedure Get(DS3: out Post_Type3) is
        Ch : Character;
    begin
        Get(DS3.J);
        Get(Ch);
        Get(DS3.B);
        Get(Ch);
        Get(DS3.O);
    end Get;

    -- Put för Post_Type_1
    procedure Put (DS1 : in Post_Type1) is
    begin
        Put(DS1.W);
        whitespace;
        Put(DS1.P);
    end Put;

    -- Put för Post_Type2_N
    procedure Put(DS2 : in Post_Type2_N) is
    begin
        Put(DS2.S,Fore => 0, Aft =>3, Exp => 0);
        whitespace;
        Put(DS2.Z);
    end Put;

    -- Put för Post_Type_2
    procedure Put (DS2 : in Post_Type2) is
    begin
        Put(DS2.D);
        whitespace;
        Put(DS2.U);
    end Put;

    -- Put för Post_Type3_N_1
    procedure Put(DS3 : in Post_Type3_N_1) is
    begin
        Put(DS3.Y);
        whitespace;
        Put(DS3.Q);
    end Put;

    -- Put för Post_Type3_N_2
    procedure Put(DS3 : in Post_Type3_N_2) is
    begin
        if DS3.T then
            Put("True ");
        else 
            Put("False ");
        end if;
        Put(DS3.L);
    end Put;

    -- Put för Post_Type_3
    procedure Put (DS3 : in Post_Type3) is
    begin
        Put(DS3.J);
        whitespace;
        Put(DS3.B);
        whitespace;
        Put(DS3.O);
    end Put;

    -- Tilldela posterna
    DS1     : Post_Type1;
    DS2     : Post_Type2;
    DS3     : Post_Type3;
begin

    Put_Line("För DS1:");
    Put("Mata in datamängd: ");
    Get(DS1);
    Put("Inmatad datamängd: ");
    Put(DS1);
    New_Line(2);
    Skip_Line;

    Put_Line("För DS2:");
    Put("Mata in datamängd: ");
    Get(DS2);
    Put("Inmatad datamängd: ");
    Put(DS2);
    New_Line(2);
    Skip_Line;

    Put_Line("För DS3:");
    Put("Mata in datamängd: ");
    Get(DS3);
    Put("Inmatad datamängd: ");
    Put(DS3);
    New_Line(2);
    Skip_Line;

end o3_1;
