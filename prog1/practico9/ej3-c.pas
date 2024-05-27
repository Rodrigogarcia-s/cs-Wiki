program mayorValor;
type CadenaN = array[1..8] of integer;
var cadn: CadenaN;
var mayorValor,posicion,i : integer;

procedure maxValorPos(cadn:CadenaN; VAR valor, pos:integer);
begin
    valor:= cadn[1];
    pos:=1;
    for i:=2 to 8 do 
    begin
        if cadn[i]> valor then 
        begin
            valor:= cadn[i];
            pos:=i;
        end;
    end;
end;
begin 
    for i:=1 to 8 do 
        readln(cadn[i]);
    maxValorPos(cadn,mayorValor,posicion);
    write('el valor mas grande es ',mayorValor);
    write(' y su posicion es ',posicion);
end.