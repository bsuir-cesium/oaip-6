program lab6;

const
  n = 5; // размер матрицы

type
  TMatrix = array [1 .. n, 1 .. n] of Integer;

var
  X: TMatrix;
  i, j, k: Integer;
  similarCount: Integer;
  doneLines: array [1 .. n] of Integer;

function InArray(var arr: array of Integer; const el: Integer): Boolean;
var
  i: Integer;
  isTrue: Boolean;
begin
  isTrue := false;
  for i := 0 to n - 1 do
  begin
    if arr[i] = el then
    begin
      isTrue := true;
      break;
    end
  end;

  InArray := isTrue;
end;

function AreRowsSimilar(row1, row2: Integer): Boolean;
var
  set1, set2: set of 1 .. n;
  i: Integer;
begin
  set1 := [];
  set2 := [];

  for i := 1 to n do
  begin
    Include(set1, X[row1, i]);
    Include(set2, X[row2, i]);
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

  // Подсчёт похожих строк
  similarCount := 0;
  for i := 1 to n - 1 do
    if InArray(doneLines, i) then
    begin

    end
    else
    begin
      for j := i + 1 to n do
        if AreRowsSimilar(i, j) then
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