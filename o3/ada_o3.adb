with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure o3 is

    -- alias to make this less gruesome
--    package T_IO renames Ada.Text_IO;
--    package I_IO renames Ada.Integer_Text_IO;
--    package F_IO renames Ada.Float_Text_IO;


    -- Declare records

    type Post_Type1 is record
        W : Character;
        P : String(1 .. 4);
    end record;

    type Post_Type2_N is record
        S : Float;
        Z : String(1 .. 4);
    end record;

    type Post_Type3_N is record
        Y, L, Q, T : Character := '@';
    end record;

    type Post_Type2 is record
        D, U : Post_Type2_N;
    end record;

    type Post_Type3 is record
        J, B, O : Post_Type3_N;
    end record;

    -- Post Instantiation
    DS1     : Post_Type1;
    DS2     : Post_Type2;
    DS3     : Post_Type3;
    White   : Character;

    -- Procedures

    procedure Whitespace is
    begin
        T_IO.Put (" ");
    end Whitespace;

    -- Float puts
    procedure Put_F (F : in Float; W : Boolean) is
    begin
        F_IO.Put(F, Fore => 0, Aft => 3, Exp => 0);
        if W then 
            Whitespace;
        end if;
    end Put_F;

    -- String Puts
    procedure Put_S (S : in String; W : Boolean) is
    begin
        T_IO.Put(S);
        if W then
            Whitespace;
        end if;
    end Put_S;
       
    -- Char Puts
    procedure Put_C (C : in Character; W : Boolean) is
    begin
        if C /= '@' then
            T_IO.Put(C);
            if W then
                Whitespace;
            end if;
        end if;
    end Put_C;

    -- Character bool  parser
    procedure Parse_Bool_Char (C : in Character) is
    begin
        if C = 'F' then
            Put_S("False", True);
        elsif C = 'T' then
            Put_S("True", True);
        end if;
    end Parse_Bool_Char;

    -- Put procedure for Post_Type_1
    procedure Put (Args : in Post_Type1) is
    begin
        Put_C (Args.W, True);
        Put_S (Args.P, True);
        T_IO.New_Line(2);
    end Put;

 -- Put procedure for Post_Type_2
    procedure Put (Args : in Post_Type2) is
    begin
      Put_F (Args.D.S, True);
      Put_S (Args.D.Z, True);
      Put_F (Args.U.S, True);
      Put_S (Args.U.Z, False);
        T_IO.New_Line(2);
    end Put;

 -- Put procedure for Post_Type_3
    procedure Put (Args : in Post_Type3) is
    begin
      Put_C (Args.J.Y, True);
      Put_C (Args.J.Q, True);
      Put_C (Args.B.Y, True);
      Put_C (Args.B.Q, True);
      Parse_Bool_Char (Args.O.T);
      Put_C (Args.O.L, False);
        T_IO.New_Line(2);
    end Put;

    -- Filter whitespaces from the input buffer
    procedure Get_C( C : in out Character) is 
    begin
        T_IO.Get(White);
        if White /= ' ' then
            C := White;
        else Get_C(C);
        end if;
    end Get_C;

    -- Get prodedure for  Post_Type_1
    procedure Get(DS: in out Post_Type1) is
    begin
        T_IO.Get(DS.W);
        T_IO.Get(White);
        T_IO.Get(DS.P);
    end Get;

-- Get prodedure for  Post_Type_2
    procedure Get(DS: in out Post_Type2) is
    begin
        F_IO.Get(DS.D.S);
        T_IO.Get(White);
        T_IO.Get(DS.D.Z);
        T_IO.Get(White);
        F_IO.Get(DS.U.S);
        T_IO.Get(White);
        T_IO.Get(DS.U.Z);
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

    T_IO.Put("För DS1:");
    T_IO.New_Line;
    T_IO.Put("Mata in datamängd: ");
    Get(DS1);
    T_IO.Put("Inmatad datamängd: ");
    Put(DS1);

    T_IO.Put("För DS2:");
    T_IO.New_Line;
    T_IO.Put("Mata in datamängd: ");
    Get(DS2);
    T_IO.Put("Inmatad datamängd: ");
    Put(DS2);

T_IO.Put("För DS3:");
    T_IO.New_Line;
    T_IO.Put("Mata in datamängd: ");
    Get(DS3);
    T_IO.Put("Inmatad datamängd: ");
    Put(DS3);


end o3;
