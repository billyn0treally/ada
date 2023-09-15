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
    else 
        Put_Line("Meddelande: " & Integer'Value(Argument(1)) * Argument(2));
        Put("Programmet """ & Command_Name & """ avslutas.");
    end if;
end o11;
