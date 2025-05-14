# Nuclear-Reactor-Temperature-Control-System

Small project using SPARK &amp; Ada.

This project was made to test knowledge of developing high integrity systems and how SPARK and Ada can be used to prevent undesired outcomes through the defining of PRE and POST conditions within the .ads file of an Ada codebase.

It simulates a nucelar reactor control terminal that handles setting the safety threshold of a reactor and then inputting the current temperatures of each of the 4 fuel rods. This is then checked against the PRE conditions in the code found in averagefueltemp.ads to ensure the data inputted is within acceptable bounds.

Additionally the outputted result is checked against a POST condition to ensure the result of the process is correct. In the context of this project it is either the reactor being Scrambled or allowed to continue running as normal.
