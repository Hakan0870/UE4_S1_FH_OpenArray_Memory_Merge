PROGRAM Merge;

  PROCEDURE Merge(a1, a2: ARRAY OF INTEGER; VAR a3: ARRAY OF INTEGER; VAR n3: INTEGER);
  VAR
    i, j: INTEGER;
  BEGIN
    j := 0;
    n3 := 0;
    FOR i := 0 TO High(a1) DO BEGIN
      a3[i] := a1[i];
      n3 := n3 + 1;
    END;

    FOR i := (High(a1) + 1) TO (High(a1) + High(a2) + 1) DO BEGIN
      IF a2[j] <> 0 THEN BEGIN
        a3[i] := a2[j];
        j := j + 1;
        n3 := n3 + 1;
      END
    END
  END;


  PROCEDURE SortArray(VAR a: ARRAY OF INTEGER; n3: INTEGER);
  VAR 
    i: INTEGER;
    j: INTEGER;
    temp: INTEGER;
  BEGIN
    temp := 0;
    FOR i := 0 TO n3 - 1 DO
      FOR j := i TO n3 DO
        IF a[i] > a[j] THEN BEGIN
          temp := a[i];
          a[i] := a[j];
          a[j] := temp
        END;
  END;



  VAR
    a1: ARRAY[0 .. 5] OF INTEGER;
    a2: ARRAY[0 .. 3] OF INTEGER;
    a3: ARRAY[0 .. 99] OF INTEGER;
    i, j, k, n3: INTEGER;

  BEGIN
    a1[0] := 15;
    a1[1] := 22;
    a1[2] := 11;
    a1[3] := 138;
    a1[4] := 138;
    a1[5] := 138;
    
    a2[0] := 143;
    a2[1] := 14;
    a2[2] := 4;
    a2[3] := 1;

    Merge(a1, a2, a3, n3);
    SortArray(a3, n3);
    IF n3 > High(a3) THEN
      n3 := -1;
    Write('a1= ');
    FOR j := 0 TO High(a1) DO
      IF a1[j] <>  0 THEN
        Write(a1[j], ', ');
    WriteLN();
    Write('a2= ');
    FOR k := 0 TO High(a2) DO
      IF a2[k] <>  0 THEN
        Write(a2[k], ', ');
    WriteLN();
    WriteLN();
    Write('a3= ');
    FOR i := 0 TO n3 DO
      IF a3[i] <>  0 THEN
        Write(a3[i], ', ');
    WriteLn;
    WriteLn('n3 = ', n3);
  END.