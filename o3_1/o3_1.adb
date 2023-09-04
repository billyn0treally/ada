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
        Y, L, Q, T : Character;
    end record;

    type Post_Type2 is record
        D, U : Post_Type2_N;
    end record;

    type Post_Type3 is record
        J, B, O : Post_Type3_N;
    end record;

    -- Döpa posterna
    DS1     : Post_Type1;
    DS2     : Post_Type2;
    DS3     : Post_Type3;
    W       : Character;

    -- Procedures

    -- Put för floats
    procedure Put_F (F : in Float; W : Boolean) is
    begin
        Put(F, Fore => 0, Aft => 3, Exp => 0);
        if W then 
            Put (" ");
        end if;
    end Put_F;

    -- Put för strängar
    procedure Put_S (S : in String; W : Boolean) is
    begin
        Put(S);
        if W then
            Put (" ");
        end if;
    end Put_S;
       
    -- Put för Chars
    procedure Put_C (C : in Character; W : Boolean) is
    begin
        if C /= '@' then
            Put(C);
            if W then
                Put (" ");
            end if;
        end if;
    end Put_C;

    -- Avgöra vilken boolean programmet ska printa
    procedure IsBool (C : in Character) is
    begin
        if C = 'F' then
            Put_S("False", True);
        elsif C = 'T' then
            Put_S("True", True);
        end if;
    end IsBool;

    -- Put för Post_Type_1
    procedure Put (DS1 : in Post_Type1) is
    begin
        Put_C (DS1.W, True);
        Put_S (DS1.P, True);
        New_Line(2);
    end Put;

 -- Put för Post_Type_2
    procedure Put (DS2 : in Post_Type2) is
    begin
      Put_F (DS2.D.S, True);
      Put_S (DS2.D.Z, True);
      Put_F (DS2.U.S, True);
      Put_S (DS2.U.Z, False);
        New_Line(2);
    end Put;

 -- Put för Post_Type_3
    procedure Put (DS3 : in Post_Type3) is
    begin
      Put_C (DS3.J.Y, True);
      Put_C (DS3.J.Q, True);
      Put_C (DS3.B.Y, True);
      Put_C (DS3.B.Q, True);
      IsBool (DS3.O.T);
      Put_C (DS3.O.L, False);
        New_Line(2);
    end Put;

    -- Filter whitespaces from the input buffer
    procedure Get_C(C : in out Character) is 
    begin
        Get(W);
        if W /= ' ' then
            C := W;
        else Get_C(C);
        end if;
    end Get_C;

    -- Get prodedure for  Post_Type_1
    procedure Get(DS: in out Post_Type1) is
    begin
        Get(DS.W);
        Get(W);
        Get(DS.P);
    end Get;

-- Get prodedure for  Post_Type_2
    procedure Get(DS: in out Post_Type2) is
    begin
        Get(DS.D.S);
        Get(W);
        Get(DS.D.Z);
        Get(W);
        Get(DS.U.S);
        Get(W);
        Get(DS.U.Z);
    end Get;

-- Get prodedure for  Post_Type_3
    procedure Get(DS: in out Post_Type3) is
    begin
      Get_C(DS3.J.Y);
      Get_C(DS3.J.Q);
      Get_C(DS3.B.Y);
      Get_C(DS3.B.Q);
      Get_C(DS3.O.T);
      Get_C(DS3.O.L);
    end Get;

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
