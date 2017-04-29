Program Matrices;

uses crt;

const
MAXFILAS = 100;
MAXCOLUMNAS = 100;

type
    matrizCompleta = array [1..MAXFILAS,1..MAXCOLUMNAS] of real;
    matriz = record
           matr:matrizCompleta;
           col:integer;
           fil:integer;
    end;

VAR
matriz1,matriz2,matriz3 : matriz;

procedure inicializarMatriz(var ma : matriz);
var
i,j : integer;
begin
     for i:=1 to ma.fil do
         for j:=1 to ma.col do
             ma.matr[i][j]:=0;
end;

function esCuadrada(ma:matriz):boolean;
begin
    esCuadrada:= ma.col = ma.fil;
end;

function matricesSonSumables(ma1,ma2:matriz):boolean;
begin
     matricesSonSumables:= (ma1.fil = ma2.fil) and (ma1.col = ma2.col);
end;

procedure mostrarMatriz(ma:matriz);
var
   i,j:integer;
begin
     for i:=1 to ma.fil do
         begin
              for j:=1 to ma.col do
                  write(ma.matr[i][j]:2:2,'   ');
              writeln;
         end;
end;

function sumarMatrices(ma1,ma2:matriz):matriz;
var
i,j:integer;
suma:matriz;

begin
     for i:=1 to ma1.fil do
         for j:=1 to ma1.col do
             suma.matr[i][j]:= ma1.matr[i][j] + ma2.matr[i][j];
     suma.fil:= ma1.fil;
     suma.col:= ma1.col;
     sumarMatrices:=suma;
end;

procedure leerMatriz(var ma:matriz);
var
i,j:integer;
valor:real;

begin
     write('Introduzca el numero de filas: ');
     readln(ma.fil);
     write('Introduzca el numero de columnas: ');
     readln(ma.col);
     inicializarMatriz(ma);

     for i:=1 to ma.fil do
         for j:=1 to ma.col do
             begin
                  clrscr;
                  gotoxy(1,1);write('Introduzca coeficiente en la posicion [',i,',',j,']: ');
                  readln(valor);
                  ma.matr[i][j]:= valor;
             end;
end;

function matricesSonMultiplicables(ma1,ma2:matriz):boolean;
begin
     matricesSonMultiplicables:= ma1.col = ma2.fil;
end;

function calcularTranspuesta(ma:matriz):matriz;
var
i,j:integer;
matraspuesta:matriz;
begin
     matraspuesta.fil:=ma.col;
     matraspuesta.col:=ma.fil;
     inicializarMatriz(matraspuesta);
     for i:=1 to ma.fil do
         for j:=1 to ma.col do
             matraspuesta.matr[j][i]:= ma.matr[i][j];

     calcularTranspuesta:=matraspuesta;
end;
function multiplicarMatrices(ma1,ma2:matriz):matriz;
var
i,j,k:integer;
multiplicacion:matriz;

begin
     multiplicacion.fil:=ma1.fil;
     multiplicacion.col:=ma2.col;
     inicializarMatriz(multiplicacion);

     for i:=1 to ma1.fil do
         for j:=1 to ma2.col do
             for k:=1 to ma1.col do
                 multiplicacion.matr[i][j]:= multiplicacion.matr[i][j] + ma1.matr[i][k] * ma2.matr[k][j];
     multiplicarMatrices:=multiplicacion;
end;

BEGIN
     
     leerMatriz(matriz1);
     leerMatriz(matriz2);
     mostrarMatriz(matriz1);
     mostrarMatriz(matriz2);
     writeln;writeln;
     writeln('Sumando las dos matrices: ');
     writeln();
     if matricesSonSumables(matriz1,matriz2) then
        begin
             matriz3:= sumarMatrices(matriz1,matriz2);
             mostrarMatriz(matriz3);
        end
     else writeln('Las matrices no se pueden sumar.');
     writeln;
     writeln;

     writeln('Calculando la transpuesta de la 1era matriz');

     matriz3:= calcularTranspuesta(matriz1);
     mostrarMatriz(matriz3);
     writeln;
     writeln;

     writeln('Multiplicando dos matrices: ');
     writeln;

     if matricesSonMultiplicables(matriz1,matriz2) then
        begin
             matriz3:= multiplicarMatrices(matriz1,matriz2);
             mostrarMatriz(matriz3);
        end
     else writeln('Las matrices no se pueden multiplicar.');

     readkey;
END.
