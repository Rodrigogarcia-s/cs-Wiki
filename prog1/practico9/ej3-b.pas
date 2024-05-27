program ordenado;
type cadenaN = array [1..9] of integer;
var cadn:cadenaN;
var ordenArreglo:boolean;
var i:integer;

function ordenado(cadn:CadenaN) : boolean;
begin
    i:=2;
    while (i<10) and (cadn[i] > cadn[i-1]) do
        i:=i+1;
    ordenado:=i=10;
end;
begin
    for i:=1 to 9 do 
        readln(cadn[i]);
    ordenArreglo:=ordenado(cadn);
    if ordenArreglo then 
        write('el arreglo esta ordenado ')
    else
        write ('el arreglo no esta ordenado');
end.
