--Spark Ada Declaration--
pragma SPARK_Mode (Off);

--Importing relevant imports--
with Ada.Text_IO, AverageFuelTemp;
use Ada.Text_IO, AverageFuelTemp;

procedure Main is

   --Variable Declarations--

   Fuel_Rod_1, Fuel_Rod_2, Fuel_Rod_3, Fuel_Rod_4 : Rod_Temp;
   AverageTemp, safety : Rod_Temp;
   temp : Integer;
   scram : Boolean;
   fuelRods : fuelRod_Array;

   User_Input : String(1..20);
   Last : Integer;

begin

   --Declaration of the main loop--
   Main_Loop:
   loop

      --Loop for designating the safety threshold ensuring valid input--
      --Safety threshold will be constant until reactor undergoes a scram--
      loop

         Ada.Text_IO.Put("Enter a safety threshold integer: ");
         temp := Integer'Value (Ada.Text_IO.Get_Line);
         exit when temp in Rod_Temp'Range;
      end Loop;
      safety := temp;

      loop

         --Loops for inputting the fuel rod temps ensuring valid inputs--
         loop
            Ada.Text_IO.Put("Enter fuel rod 1 temp: ");
            temp := Integer'Value (Ada.Text_IO.Get_Line);
            exit when temp in Rod_Temp'Range;
         end loop;
         Fuel_Rod_1 := temp;

         loop
            Ada.Text_IO.Put("Enter fuel rod 2 temp: ");
            temp := Integer'Value (Ada.Text_IO.Get_Line);
            exit when temp in Rod_Temp'Range;
         end loop;
         Fuel_Rod_2 := temp;

         loop
            Ada.Text_IO.Put("Enter fuel rod 3 temp: ");
            temp := Integer'Value (Ada.Text_IO.Get_Line);
            exit when temp in Rod_Temp'Range;
         end loop;
         Fuel_Rod_3 := temp;

         loop
            Ada.Text_IO.Put("Enter fuel rod 4 temp: ");
            temp := Integer'Value (Ada.Text_IO.Get_Line);
            exit when temp in Rod_Temp'Range;
         end loop;
         Fuel_Rod_4 := temp;

         fuelRods := (Fuel_Rod_1, Fuel_Rod_2, Fuel_Rod_3, Fuel_Rod_4);

         --Applying the procedures--
         averageTempCheck(fuelRods, averageTemp);
         scramble(averageTemp, safety, scram);

         --Checking if the result of the scramble was true--
         if scram = True then
            Ada.Text_IO.Put_Line("Reactor SCRAM occuring, safety Threshold exceeded!");
            --clearing input buffer--
            Ada.Text_IO.Put("Do you want to restart reactor (y/n): ");
            Ada.Text_IO.Get_Line(User_Input, Last);

            if User_Input(1 .. 1) = "n" and last > 0 then
               exit Main_Loop;
            end if;

            exit when User_Input(1 .. 1) = "y" and Last > 0;

         else
            Ada.Text_IO.Put_Line("Reactor within designated safety limits");

            --clearing input buffer--
            Ada.Text_IO.Put("Do you want to disable reactor (y/n): ");
            Ada.Text_IO.Get_Line(User_Input, Last);

            if User_Input(1 .. 1) = "y" and last > 0 then
               exit Main_Loop;
            end if;

            Ada.Text_IO.Put_Line("Beginning new temp checks");
         end if;

      end loop;
      Ada.Text_IO.Put_Line("");
      Ada.Text_IO.Put_Line("Beginning next test");


   end loop Main_Loop;
end Main;
