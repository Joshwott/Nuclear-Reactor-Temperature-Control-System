--Spark Ada Declaration--
pragma SPARK_Mode (On);

package body AverageFuelTemp is
   
   --Procedure to loop over the all the reactors fuel rods and find an average temperature--
   procedure averageTempCheck(fuelRods : in fuelRod_Array; averageTemp : out Rod_Temp) is
             
      --FuelRods : fuelRod_Array;      
      tempSum : Integer;            
      
   begin
                  
      tempSum := 0;
      
      --Loop to iterate and sum all values in the array of fuel rods--
      for i in fuelRod_Array'Range loop
         tempSum := tempSum + fuelRods(i);
      end loop;
      
      --averages the temperatures--     
      averageTemp := tempSum/fuelRod_Array'Length;
        
   end averageTempCheck;
   
      
   --Procedure to determine whether a scramble needs to occur--     
   procedure scramble (averageTemp, safety : in Rod_Temp; scram : out Boolean) is
         
   begin
      
      scram := False;
      
      --Check to see if average temp is over the safety threshold--
      if averageTemp >= safety then                   
         scram := True;         
      end if;
      if averageTemp < safety then
         scram := False;
      end if;
      
            
   end scramble;
        
end AverageFuelTemp;
