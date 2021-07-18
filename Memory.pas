PROGRAM Memory;
  TYPE
    Field = RECORD
      empty: BOOLEAN;
      stack: CHAR;
    END;
    
    Board = ARRAY[1..6] OF ARRAY[1..5] OF Field;


  PROCEDURE SetUpBoard(VAR z: Board);
    VAR
      i, j, k: INTEGER;
      randomNumber: INTEGER;
      r: ARRAY[1..30] OF CHAR;
      shuffle: ARRAY[1..30] OF CHAR;
    BEGIN
      Randomize;
      r[1] := 'C'; r[2] := 'F'; r[3] := 'B'; r[4] := 'M'; r[5] := 'G'; r[6] := 'J'; r[7] := 'D'; r[8] := 'I'; r[9] := 'N'; r[10] := 'H';
      r[11] := 'K'; r[12] := 'A'; r[13] := 'F'; r[14] := 'E'; r[15] := 'O'; r[16] := 'A'; r[17] := 'M'; r[18] := 'J'; r[19] := 'O'; r[20] := 'E';
      r[21] := 'D'; r[22] := 'H'; r[23] := 'N'; r[24] := 'K'; r[25] := 'B'; r[26] := 'L'; r[27] := 'I'; r[28] := 'L'; r[29] := 'C'; r[30] := 'G';
      randomNumber := Random(29) + 1;
      FOR k := 1 TO 30 DO BEGIN
        Shuffle[k] := r[randomNumber];
          IF randomNumber < 30 THEN
            randomNumber := randomNumber + 1
            ELSE
            randomNumber := 1
      END;
      k := 1;
      FOR i := 1 TO 6 DO
		    FOR j := 1 TO 5 DO BEGIN       
			    z[i][j].empty := FALSE;
          z[i][j].stack := shuffle[k];
          k := k + 1;
        END;
    END;

  PROCEDURE ShowBoard(VAR z:Board);
    VAR
      i, j: INTEGER;
    BEGIN
      WriteLn();
      WriteLn('aktuelles Spielfeld, X = leeres Feld, O = verdeckte Karte');
      WriteLn();
      FOR i := 1 TO 6 DO BEGIN
		    FOR j := 1 TO 5 DO 
            IF z[i][j].empty = TRUE THEN
              Write('  X  ')
            ELSE
              Write('  O  ');
        WriteLn();
      END;
      WriteLn();
      WriteLn();
      WriteLn();
      WriteLn('TESTFELD:');
      FOR i := 1 TO 6 DO BEGIN
		    FOR j := 1 TO 5 DO 
          Write(z[i][j].stack, '  ');
        WriteLn();
      END;
      WriteLn();
      WriteLn();
      WriteLn();
    END;

  PROCEDURE Select(VAR z: Board; VAR first, second: CHAR; VAR Player1, Player2: INTEGER);
    VAR
      i, j, k, l, p: INTEGER;
    BEGIN
      i := 0;
      j := 0;
      k := 0;
      l := 0;
      WriteLn('Bitte geben Sie eine x-Koordinate(von links nach rechts) fuer die erste Karte ein: ');
      ReadLn(j);
      WriteLn('Bitte geben Sie eine y-Koordinate(von oben nach unten) fuer die erste Karte ein: ');
      ReadLn(i);
      first := z[i][j].stack;
      WriteLn('Erste Karte: ', first);
      WriteLn();
      WriteLn('Bitte geben Sie eine x-Koordinate(von links nach rechts) fuer die zweite Karte ein: ');
      ReadLn(l);
      WriteLn('Bitte geben Sie eine y-Koordinate(von oben nach unten) fuer die zweite Karte ein: ');
      ReadLn(k);    
      second := z[k][l].stack;  
      WriteLn('Zweite Karte: ', second);
      WriteLn();
      IF z[i][j].empty = FALSE THEN
        IF first = second THEN BEGIN
          z[i][j].empty := TRUE;
          z[k][l].empty := TRUE;
          WriteLn();
          WriteLn();
          WriteLn('Sie haben ein Kartenpaar gefunden!');
          WriteLn();
          WriteLn('Sind Sie Spieler 1 oder 2?');
          ReadLn(p);
            IF p = 1 THEN
              Player1 := Player1 + 1;
            IF p = 2 THEN
              Player2 := Player2 + 1;
          WriteLn();
        END
        ELSE BEGIN
          WriteLn();
          WriteLn();
          WriteLn('Sie haben leider kein Kartenpaar gefunden!');
          WriteLn();
        END
      ELSE 
        WriteLn('Sie haben leider kein neues Kartenpaar gefunden!');
      WriteLn();
      WriteLn('Spielstand: ');
      WriteLn('Spieler 1: ', Player1);
      WriteLn('Spieler 2: ', Player2);
  END;



VAR
  z: Board;
  first, second: CHAR;
  Player1, Player2: INTEGER;
BEGIN
  Player1 := 0;
  Player2 := 0;
  SetUpBoard(z);
  WHILE (Player1 < 8) AND (Player2 < 8) DO BEGIN
    ShowBoard(z);
    Select(z, first, second, Player1, Player2);
  END;
  IF Player1 > Player2 THEN
    WriteLn('Spieler 1 hat gewonnen!!!')
  ELSE
    WriteLn('Spieler 2 hat gewonnen!!!')
END.
