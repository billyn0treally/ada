-- mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

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

    type Post_Type3_N is record
        Y, L, Q : Character;
        T : Boolean;
    end record;

    type Post_Type2 is record
        D, U : Post_Type2_N;
    end record;

    type Post_Type3 is record
        J, B, O : Post_Type3_N;
    end record;

    -- Tilldela posterna
    DS1     : Post_Type1;
    DS2     : Post_Type2;
    DS3     : Post_Type3;

    -- Procedures

    -- Get för  Post_Type_1
    procedure Get(DS: in out Post_Type1) is
    W : Character;
    begin
        Get(DS.W);
        Get(W);
        Get(DS.P);
    end Get;

    -- Put för Post_Type_1
    procedure Put (DS1 : in Post_Type1) is
    begin
        Put(DS1.W);
        Put(" ");
        Put(DS1.P);
        New_Line(2);
    end Put;

    -- Get för  Post_Type_2
    procedure Get(DS: in out Post_Type2) is
    W : Character;
    begin
        Get(DS.D.S);
        Get(W);
        Get(DS.D.Z);
        Get(W);
        Get(DS.U.S);
        Get(W);
        Get(DS.U.Z);
    end Get;

    -- Put för Post_Type_2
    procedure Put (DS2 : in Post_Type2) is
    begin
        Put(DS2.D.S,0,3,0);
        Put (" ");
        Put(DS2.D.Z);
        Put (" ");
        Put(DS2.U.S,0,3,0);
        Put (" ");
        Put(DS2.U.Z);
        New_Line(2);
    end Put;

    -- Get för  Post_Type_3
    procedure Get(DS: in out Post_Type3) is
    W : Character;
    begin
        Get(DS3.J.Y);
        Get(W);
        Get(DS3.J.Q);
        Get(W);
        Get(DS3.B.Y);
        Get(W);
        Get(DS3.B.Q);
        Get(W);
        Get(W);
        if W = 'T' then
            DS3.O.T := True;
        else
            DS3.O.T := False;
        end if;  
        Get(W);
        Get(DS3.O.L);
    end Get;

    -- Put för Post_Type_3
    procedure Put (DS3 : in Post_Type3) is
    begin
        Put(DS3.J.Y);
        Put (" ");
        Put(DS3.J.Q);
        Put (" ");
        Put(DS3.B.Y);
        Put (" ");
        Put(DS3.B.Q);
        Put (" ");
        if DS3.O.T = True then
            Put("True ");
        else 
            Put("False ");
        end if;
        Put(DS3.O.L);
        New_Line(2);
    end Put;

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

    Put("För DS3:");
    New_Line;
    Put("Mata in datamängd: ");
    Get(DS3);
    Put("Inmatad datamängd: ");
    Put(DS3);


end o3_1;
