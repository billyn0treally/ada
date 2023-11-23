with Ada.Text_IO; use Ada.Text_IO;

procedure p30 is
   -- Define an enumeration for the row labels
   type Row_Labels is ('B', 'C', 'D', 'E');

   -- Define an integer range for the column labels
   subtype Col_Labels is Integer range 5 .. 7;

   type QA_Record is record
      Q : String (1 .. 3);  -- Three characters for the question
      A : Character;        -- One character for the answer
   end record;

   -- Declare the array type using the enumeration and subtype for indices
   type T is array (Row_Labels, Col_Labels) of QA_Record;

   procedure Get (Item : out QA_Record) is
      Dummy : Character;
   begin
      -- Read each character for the question
      for I in Item.Q'Range loop
         Get (Item.Q (I));
      end loop;

      -- Read and discard the space
      Get (Dummy);

      -- Check if the space is indeed a space character
      if Dummy /= ' ' then
         Put_Line ("Error: Space expected between question and answer.");
      end if;

      -- Read the answer character
      Get (Item.A);
   end Get;

   procedure Put (Item : in QA_Record) is
   begin
      Put (Item.Q);
      Put (" ");
      Put (Item.A);
   end Put;

   procedure Get (Matrix : out T) is
   begin
      for Row in Row_Labels loop
         for Col in reverse Col_Labels loop
            Get (Matrix (Row, Col));
         end loop;
      end loop;
   end Get;

   procedure Put (Matrix : in T) is
   begin
      for Row in Row_Labels loop
         for Col in reverse Col_Labels loop
            Put (Matrix (Row, Col));
         end loop;

      end loop;
   end Put;

   My_T : T;

begin
   -- Input and output for the entire matrix 'T'
   Put ("Mata in datamängd för hela matrisen: ");
   Get (My_T);
   Skip_Line;
   Put ("Inmatad datamängd för hela matrisen: ");
   Put (My_T);
end p30;
