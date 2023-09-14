--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;

procedure Hello is
    
    N: Integer;
    F: Float;
    C: Character;
    S: String(1..5);
begin
   Put ("Skriv in ett heltal: ");
   Get(N);
   Put("Du skrev in talet: ");
   Put(N, Width =>2);
   Skip_Line;
   New_Line;
   New_Line;
   Put("Skriv in fem heltal: ");
   Get(N);
   Put("Du skrev in talen: ");
   Put(N, Width =>0);
   Put(" ");
   Get(N);
   Put(N, Width =>0);
   Put(" ");
   Get(N);
   Put(N, Width =>0);
   Put(" ");
   Get(N);
   Put(N, Width =>0);
   Put(" ");
   Get(N);
   Put(N, Width =>0);

   Skip_Line;
   New_Line;
   New_Line;
   Put("Skriv in ett flyttal: ");
   Get(F);
   Put("Du skrev in flyttalet: ");
   Put(F, Fore=> 1, Aft =>3, Exp=>0);

   Skip_Line;
   New_Line;
   New_Line;
   Put("Skriv in ett ett heltal och ett flyttal: ");
   Get(N);
   Get(F);
   Put("Du skrev in heltalet: ");
   Put(N, 9);
   New_Line;
   Put("Du skrev in flyttalet: ");
   Put(F, Fore=> 3, Aft =>4, Exp=>0);

   Skip_Line;
   New_Line;
   New_Line;
   Put("Skriv in ett tecken: ");
   Get(C);
   Put("Du skrev in tecknet: ");
   Put(C);

   Skip_Line;
   New_Line;
   New_Line;

   Put("Skri in en sträng med 5 tecken: ");
   Get(S);
   Put("Du skrev in strängen: ");
   Put(S);
   
   Skip_Line;
   New_Line;
   New_Line;

   Put("Skri in en sträng med 3 tecken: ");
   Get(S(1..3));
   Put("Du skrev in strängen: ");
   Put(S(1..3));

   Skip_Line;
   New_Line;
   New_Line;
   
   Put("Skriv in ett heltal och en sträng med 5 tecken: ");
   Get(N);
   Get(C);
   Get(S(1..5));
   Put("Du skrev in talet |");
   Put(N, 0);
   Put("| och strängen |");
   Put(S(1..5));
   Put("|.");

   Skip_Line;
   New_Line;
   New_Line;
   
   Put("Skriv in wn sträng med 3 tecken och ett flyttal: ");
   Get(S(1..3));
   Get(C);
   Get(F);
   Put("Du skrev in """);
   Put(F, Fore => 2, Aft => 3, Exp => 0);
   Put(""" och ");
   Put("""");
   Put(S(1..3));
   Put(""".");
   
   Skip_Line;
   New_Line;
   New_Line;
     
   Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line(S, N);
   if N >= 5 then
       Skip_Line;
   end if;
   Put("Du skrev in strängen: ");
   Put(S(1..N));
   
   New_Line;
   New_Line;

   Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line(S, N);
   if N >= 5 then
       Skip_Line;
   end if;
   Put("Du skrev in strängen: ");
   Put(S(1..N));
   New_Line;
   New_Line;
   

end Hello;
