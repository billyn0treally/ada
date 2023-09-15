--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Command_Line; 	use Ada.Command_Line;
with Ada.Text_Io; 	use Ada.Text_Io;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
--with Ada.Strings.Bounded; use Ada.Strings.Bounded;
--with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--with Ada.Strings;       use Ada.Strings;    

procedure o11 is
begin
    if Argument_Count = 0 then
        Put("Inga argument angivna.");
    elsif Argument_Count < 3 or Argument_Count > 3 then
        Put("Fel antal argument angivna.");
    elsif Argument(1) = Command_Name or Argument(1)(3..Argument(1)'Last) /= Command_Name then
        Put("Error! Input file """ & Argument(1) & """ cannot be same as the program itself!");
    else 
        --Put_Line("Meddelande: " & Integer'Value(Argument(1)) * Argument(3) & (Argument(2)));
        Put("Meddelande: ");
        For I in 1..Integer'Value(Argument(3)) loop
            Put(Argument(1));
        end loop;
        Put(Argument(2));
        New_Line;
        Put("Programmet """ & Command_Name & """ avslutas.");
    end if;
end o11;
