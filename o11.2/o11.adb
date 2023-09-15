--mikna021: Samarbetat med melgu374, Melker Gustafsson, samma program
with Ada.Command_Line; 	use Ada.Command_Line;
with Ada.Text_Io; 	use Ada.Text_Io;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure o11 is
begin
    if Argument_Count = 0 then
        Put("Inga argument angivna.");
    elsif Argument_Count < 3 or Argument_Count > 3 then
        Put("Fel antal argument angivna.");
    elsif Argument(1) = Command_Name or Command_Name(3..Command_Name'Last) = Argument(1) then
        Put("Error! Input file """ & Argument(1) & """ cannot be same as the program itself!");
    elsif Argument(1) = Argument(2) or Argument(1)(3..Argument(1)'Last) = Argument(2) or Argument(2)(3..Argument(2)'Last) = Argument(1) then
        Put("Error! Output file """ & Argument(2) & """ cannot be same as input file!");
    else 
        Put("Meddelande: ");
        For I in 1..Integer'Value(Argument(3)) loop
            Put(Argument(1));
        end loop;
        Put(Argument(2));
        New_Line;
        Put("Programmet """ & Command_Name & """ avslutas.");
    end if;
end o11;
