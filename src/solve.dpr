program lab6;

const
  n = 5; // размер матрицы

type
  TMatrix = array [1 .. n, 1 .. n] of Integer;
  TMAS = array [1 .. n] of Integer;
  TSet = set of 1 .. n;

var
  X: TMatrix;
  i, j, k: Integer;
  similarCount: Integer;
  doneLines: TMAS;

function InArray(var arr: TMAS; const el: Integer): Boolean;
var
  i: Integer;
  isTrue: Boolean;
begin
  isTrue := false;
  for i := 1 to n do
  begin
    if arr[i] = el then
    begin
      isTrue := true;
      break;
    end
  end;

  InArray := isTrue;
end;

function AreRowsSimilar(var matrix: TMatrix; const row1, row2: Integer): Boolean;
var
  set1, set2: TSet;
  i: Integer;
begin
  set1 := [];
  set2 := [];

  for i := 1 to n do
  begin
    Include(set1, matrix[row1, i]);
    Include(set2, matrix[row2, i]);
  end;

  AreRowsSimilar := set1 = set2;
end;

begin
  // Ввод матрицы
  for i := 1 to n do
  begin
    doneLines[i] := 0;
    for j := 1 to n do
    begin
      Write('Enter element X[', i, ',', j, ']: ');
      ReadLn(X[i, j]);
    end;
  end;

  similarCount := 0;
  for i := 1 to n - 1 do
    if InArray(doneLines, i) then
    begin

    end
    else
    begin
      for j := i + 1 to n do
        if AreRowsSimilar(X, i, j) then
        begin
          Inc(similarCount);
          doneLines[i] := i;
          doneLines[j] := j;
          WriteLn('Rows ', i, ' and ', j, ' are similar.');
        end;
    end;

  if similarCount = 0 then
    WriteLn('No similar rows found.')
  else
    WriteLn('Total similar rows pairs: ', similarCount);
  ReadLn;

end.