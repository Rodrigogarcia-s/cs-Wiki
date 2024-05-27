program cantMayores;
var num,i,mayores: integer;
type CadenaN = array [1..9] of integer;
var cadn : CadenaN;

function cantMayores(cadn:CadenaN; num:integer) : integer;
begin
  mayores:=0;
  for i:=1 to 9 do 
  begin
    if cadn[i] > num then
    mayores:= mayores+1;
  end;
  cantMayores:=mayores;
end;

begin
  cadn[1]:=1;
  for i:=2 to 9 do 
  begin
    cadn[i]:=cadn[i-1]+1;
  end;
  read(num);
  write('La cantidad de numeros mayores a', num, ' es ',cantMayores(cadn,num));
end.