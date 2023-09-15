--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 

procedure TangentbordInput is
   
   Heltal : Integer;
   Flyttal : Float;
   Tecken : Character;
   Strang : String (1..5);

   
begin
   Put("Skriv in ett heltal: ");
   Get (Heltal);
   Skip_Line;
   Put("Du skrev in talet: ");
   Put(Heltal, Width=> 0);
   New_Line(2);
   Put("Skriv in fem heltal: ");
   Get(Heltal);
   Put("Du skrev in talen: ");
   Put(Heltal, Width =>0); 
   Put(" ");
   Get(Heltal);
   Put(Heltal, Width =>0); 
   Put(" ");
   Get(Heltal);
   Put(Heltal, Width =>0); 
   Put(" ");
   Get(Heltal);
   Put(Heltal, Width =>0); 
   Put(" ");
   Get(Heltal);
   Put(Heltal, Width =>0); 
  
   Skip_Line;  
   New_Line(2);
   Put("Skriv in ett flyttal: ");
   Get(Flyttal);
   
   Put("Du skrev in flyttalet: ");
   Put(Flyttal, Fore=> 0, Aft =>3, Exp =>0);
   Skip_Line;
   
   New_Line(2);
   Put("Skriv in ett heltal och ett flyttal: ");
   Get(Heltal) ;
   Get(Flyttal);
   Put("Du skrev in heltalet: ");
   Put(Heltal, Width =>9); 
   New_Line;
   Put("Du skrev in flyttalet:");
   Put(Flyttal, Fore=> 4, Aft =>4, Exp =>0);
   Skip_Line;
   New_Line(2);
   Put("Skriv in ett tecken: ");
   Get(Tecken);
   Put("Du skrev in tecknet: ");
   Put(Tecken);
   Skip_Line;
   New_Line(2);
   Put("Skriv in en sträng med 5 tecken: ");
   Get(Strang);
   Put("Du skrev in strängen: ");
   Put(Strang);
   Skip_Line;
   New_Line(2);
   Put("Skriv in en sträng med 3 tecken: ");
   Get(Strang(1..3));
   Put("Du skrev in strängen: ");
   Put(Strang(1..3));
   Skip_Line;
   
   New_Line(2);
   Put("Skriv in ett heltal och en sträng med 5 tecken: ");
   Get(Heltal);
   Get(Tecken);
   Get(Strang);
   Put("Du skrev in talet |");
   Put(Heltal, 0);
   Put("|");
   Put(" och strängen |");
   Put(Strang(1..5));
   Put("|.");
   Skip_Line;
   New_Line(2);
   Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
   Get(Strang(1..3));
   Get(Flyttal);
   Put("Du skrev in """);
   Put(Flyttal,2,3,0);
   Put(""" och ");
   Put("""");
   Put(Strang(1..3));
   Put(""".");
   Skip_Line;
   New_Line(2);
   
   Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line(Strang, Heltal);
     if Heltal = 5 then
      Skip_Line;
   end if;
   Put("Du skrev in strängen: ");
   Put(Strang(1..Heltal));
   New_Line(2);
   
   Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line(Strang,Heltal);
   if Heltal = 5 then
      Skip_Line;
   end if;
   Put("Du skrev in strängen: ");
   Put(Strang(1..Heltal));
   

   
end TangentbordInput;

   
   
   
