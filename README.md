# Nuclear-Reactor-Temperature-Control-System

Small project using SPARK &amp; Ada.

This project was made to test knowledge of developing high integrity systems and how SPARK and Ada can be used to prevent undesired outcomes through the defining of PRE and POST conditions.

It simulates a nucelar reactor control terminal that handles setting the safety threshold of a reactor and then inputting the current temperatures of each of the 4 fuel rods. This is then checked against the PRE conditions in the code found in averagefueltemp.ads to ensure the data inputted is within acceptable bounds.

Additionally the outputted result is checked against a POST condition to ensure the result of the process is correct. In the context of this project it is either the reactor being Scrambled or allowed to continue running as normal.

# NOTE: This was project originally created at university, however it has since been modified to remove any content that may breach any form of restrictions placed upon it due to the use of resources such as custom files and wrappers. Concept and development of the project was still entirely my own work and doing.
