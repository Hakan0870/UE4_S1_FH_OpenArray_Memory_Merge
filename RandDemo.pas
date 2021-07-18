(* Application demonstrating the generation of random numbers. *)
{GH, 09.11.2017}
PROGRAM RandDemo;
VAR
	i, randomNumber: INTEGER;
BEGIN
	(* call Randomize (only) once(!) as the first line in your program *)
	(* --> this initializes the random numbers generator *)
	Randomize;

	(* ALTERNATIVELY: directly assign a value to RandSeed *)
	(* --> like this the random numbers generator will create the exact same sequence of random numbers over and over again *)
	(* (different seed values can be used to create different sequences of random numbers) *)
	(* RandSeed := 12345; *)

	(* generate and display twenty random numbers between 1 and 100 *)
	FOR i := 1 TO 20 DO BEGIN
		(* --> Random(X) generates a random integer value N where 0 <= N < X *)
		randomNumber := Random(100) + 1;
		Write(randomNumber, ' ');
	END;
	WriteLn;
END.