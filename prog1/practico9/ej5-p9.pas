 program ej5p9;
 const M = 3; {valor mayor estricto a 1}
 const N = 6 ;{valor mayor estricto a M}
 type
    CadenaM = array [1..M] of char;
    CadenaN = array [1..N] of char;
 var cadnM:CadenaM;
 var cadnN:CadenaN;

procedure leerCadenaM(var arreglo:CadenaM);
var i: integer;
begin
i:=1;
    for i:=1 to M do 
        read(arreglo[i]);
    readln();
end;
procedure leerCadenaN(var arreglo:CadenaN);
var i: integer;
begin
i:=1;
    for i:=1 to N do 
        read(arreglo[i]);
end;
function indiceSubCadena(arregloM:CadenaM; arregloN:CadenaN): integer;
var ind,i,x: integer;
begin
    ind:=1;
    i:=1;
    x:=1;
    while (i<=N) and (arregloM[1] <> arregloN[i]) do
    begin
        i:=i+1;
        ind:=i;
    end;
    if i<=N then
    begin
        while (x<=M) and (arregloM[x]=arregloN[i]) do
        begin
            i:=i+1;
            x:=n+1;
        end;
        if x>M then 
            indiceSubCadena:= ind
        else
            indiceSubCadena:= 0; 
    end;
end;
begin
    write('ingrese la cadena de M caracteres');
    leerCadenaM(cadnM);
    write('ingrese la cadena de N caracteres');
    leerCadenaN(cadnN);
    write('la cadena se encunetra a partir de  ',indiceSubCadena(cadnM,cadnN));
end.