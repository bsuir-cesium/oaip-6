program lab6;

const
  n = 5; // размер матрицы

type
  TMatrix = array [1 .. n, 1 .. n] of Integer;
  TMAS = array [1 .. n] of Integer;
  TSet = set of 1 .. n;

var
  X: TMatrix = (
    (1, 1, 1, 1, 1),
    (1, 1, 1, 1, 2),
    (1, 1, 1, 1, 3),
    (1, 1, 1, 1, 4),
    (1, 1, 1, 1, 5)
  );
  i, j: Integer;
  similarCount: Integer;
  doneLines: TMAS;
  lineInArray, similar: Boolean;

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

function AreRowsSimilar(var matrix: TMatrix; const row1, row2: Integer)
  : Boolean;
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
  // Подсчёт похожих строк
  similarCount := 0;
  for i := 1 to n - 1 do
  begin
    lineInArray := InArray(doneLines, i);
    if lineInArray then
    begin

    end
    else
    begin
      for j := i + 1 to n do
      begin
        similar := AreRowsSimilar(X, i, j);
        if similar then
        begin
          Inc(similarCount);
          doneLines[i] := i;
          WriteLn('Строки ', i, ' и ', j, ' похожи');
        end;
      end;
    end;
  end;

  if similarCount = 0 then
    WriteLn('Не нашлось похожих строк')
  else
    WriteLn('Итоговое кол-во похожих пар строк: ', similarCount);
  ReadLn;

end.