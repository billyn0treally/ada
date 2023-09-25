-- mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

--Krav för uppgiften:

--CHECK  Felaktigt definierad datatyp

--Viktigt för uppgiften:

--CHECK?  Ordning av kodens olika delar

--CHECK  Parametrar i underprogram har felaktig mod

--  Skapa en Get/Put för varje datatyp, även inre

--  Saknar specificerare för Put för heltal eller flyttal

--  Onaturligt eller felaktigt formulerade if-satser

--CHECK  Rensar inte bufferten innan påföljande inmatning skall påbörjas

--Viktigt för framtiden:

--CHECK  Undvik att lägga New_line i Put

--CHECK?  Kvarvarande tecken i inmatningsbuffert

--Tips:

--  Använd tecken istället för sträng om möjligt

--CHECK Lämna inte in onödiga saker i koden, paket

--CHECK?  Använd Put_Line istället

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

    -- Tilldela posterna
    DS1     : Post_Type1;
    DS2     : Post_Type2;
    DS3     : Post_Type3;

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

    -- Get för  Post_Type_2
    procedure Get(DS2: out Post_Type2) is
        Ch : Character;
    begin
        Get(DS2.D.S);
        Get(Ch);
        Get(DS2.D.Z);
        Get(Ch);
        Get(DS2.U.S);
        Get(Ch);
        Get(DS2.U.Z);
    end Get;

    -- Get för  Post_Type_3
    procedure Get(DS3: out Post_Type3) is
        Ch : Character;
    begin
        Get(DS3.J.Y);
        Get(Ch);
        Get(DS3.J.Q);
        Get(Ch);
        Get(DS3.B.Y);
        Get(Ch);
        Get(DS3.B.Q);
        Get(Ch);
        Get(Ch);
        if Ch = 'T' then
            DS3.O.T := True;
        else
            DS3.O.T := False;
        end if;  
        Get(Ch);
        Get(DS3.O.L);
    end Get;

    -- Put för Post_Type_1
    procedure Put (DS1 : in Post_Type1) is
    begin
        Put(DS1.W);
        whitespace;
        Put(DS1.P);
    end Put;

    -- Put för Post_Type_2
    procedure Put (DS2 : in Post_Type2) is
    begin
        Put(DS2.D.S,0,3,0);
        whitespace;
        Put(DS2.D.Z);
        whitespace;
        Put(DS2.U.S,0,3,0);
        whitespace;
        Put(DS2.U.Z);
    end Put;

    -- Put för Post_Type_3
    procedure Put (DS3 : in Post_Type3) is
    begin
        Put(DS3.J.Y);
        whitespace;
        Put(DS3.J.Q);
        whitespace;
        Put(DS3.B.Y);
        whitespace;
        Put(DS3.B.Q);
        whitespace;
        if DS3.O.T = True then
            Put("True ");
        else 
            Put("False ");
        end if;
        Put(DS3.O.L);
    end Put;

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
