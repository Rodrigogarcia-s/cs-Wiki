program ej3p9;
type arregloBidmensional = array [ 1..2, 1..2] of integer;
var arreglo: arregloBidmensional;
var i,x,m,n: integer;
procedure leerMatriz (var arreglo:arregloBidmensional);
begin
    for i:=1 to 2 do 
    begin
        for x:=1 to 2 do
        read(arreglo[i,x]);
    end;
end;
procedure intercambio(var arreglo:arregloBidmensional);
var temp :arregloBidmensional;
begin
    temp[m,n]:=arreglo[n,m];
    temp[n,m]:=arreglo[m,n];
    arreglo[n,m]:=temp[n,m];
    arreglo[m,n]:=temp[m,n];
end;
begin
    write ('ingrese filas m y n');
    read(m,n);
    write ('ingrese matriz');
    leerMatriz(arreglo);
    if (0<m) and (0<n) and (n<3) and (m<3) then
    begin
        intercambio(arreglo);
        write(arreglo[1,2]);
        write(arreglo[2,1]);
    end
    else 
    write('m y/o n no corresponden a numeros de fila validos');
end.