--Spark Ada Declaration--
pragma SPARK_Mode (On);

package AverageFuelTemp is
     
   
   --Declaration of subtype to bind the fuel rod temp to higher than that of absolute zero--
   --This is because although very unrealistic it is still a possible temp and therefore must be considered--
   --The Max is set to the boiling point of Uranium which is the fuel for the reactor--
   subtype Rod_Temp is Integer range -273..4131;
   
   --Fuel Rod array size decided here can be adjusted to allow for bigger reactors--
   type fuelRod_Array is array (1..4) of Rod_Temp;
   
         
   
   --Specification of procedure averageTempCheck--
   --Takes in all Fuel rod variables and outputs the average temp--
   procedure averageTempCheck (fuelRods : in fuelRod_Array; averageTemp : out Rod_Temp)with
     Depends => ((averageTemp) => (fuelRods)),
     Pre => ((fuelRods'Length in fuelRod_Array'Range) and (fuelRods'Length > 0)),          
     Post => ((if FuelRods'Length = 0 then AverageTemp = 0) or  
         (FuelRods'Length > 0 and then            
            (for all i in FuelRods'Range => FuelRods(i) = AverageTemp)));

           
   --Specification of procedure scramble--
   --Takes in the average temp and safety then outputs the whether to SCRAM--
   procedure scramble (averageTemp, safety : in Rod_Temp; scram : out Boolean)
     with Depends => ((scram) => (averageTemp, safety)),
     Pre => ((averageTemp in Rod_Temp'Range) and
               (safety in Rod_Temp'Range)),
     Post => ((scram = True) or (scram = False));
   

end AverageFuelTemp;
