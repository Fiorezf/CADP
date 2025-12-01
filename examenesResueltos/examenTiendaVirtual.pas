{Una tienda virtual necesita un programa para administrar la información de sus clientes. De cada cliente se lee: número, DNI, apellido y nombre, fecha de nacimiento (día, mes y año),
 nivel (1..5) y puntaje. La lectura finaliza cuando se lee el cliente con DNI 33444555, que debe procesarse.

Se pide:

A) Generar una estructura que contenga número, apellido y nombre de aquellos clientes con DNI compuesto solamente por dígitos impares.

B) Informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos antes del año 2000.

C) Implementar un módulo que elimine, de la estructura generada, la información relacionada a un número de cliente recibido por parámetro. Tener en cuenta 
que dicho número puede no existir en la estructura.}

program parcial;

const
nivel=5;
mes=12;

type
cadena20:string[20];
raDia:1..dia;
raMes:1..mes;
raNivel:1..nivel;

cliente = record 
num:integer;
dni:integer;
apeNom:cadena20;
fecha:reFecha;
nivel:raNivel;
puntaje:real;
end;
reFecha = record 
dia:integer;
mes:raMes;
anio:integer;
end; 
cliente2=record 
num:integer;
apeNom:cadena20;
end;
lista=^nodo;
nodo=record 
dato:cliente2;
sig:lista;
end;
contador=array[raNivel] of real; 

//-----------Modulos 

procedure leerRegistro (var c:cliente) 
begin 
readln(c.num);
readln(c.apenom);
readln(c.fecha.dia);
readln(c.fecha.mes);
readln(c.fecha.anio);
readln(c.nivel);
readln(c.puntaje);
end;

procedure maxMin (v:contador,var max,min:real; var nivelMax,nivelMin:string); 
var
i:raNivel;
begin 
for i:= 1 to nivel do begin
 if (v[i]>max) then 
  max:=v[vi];
  nivelMax:=i;
 
 if (v[i]<min) then 
  min:=v[i];
  nivelMin:=i;
  end;
end;
end; 

function impar (dni:integer):boolean
var 
 dig:integer;
 ok:boolean;

begin
dig:=0;
ok:=true;
while(dni<>0) and (ok=true) do begin
 dig:=dni mod 10;
if(dig mod 2=0) then
 ok:=false
dni:=dni div 10
end

impar:=ok;
end;


procedure inicializarContador (var v:contador); 
var 
i:raNivel
begin
 for i:=1 to nivel do 
  v[i]:=0;
 end;
end;

procedure agregarAtras (var l:lista,c2:cliente2, var ult:lista); 
var
 nuevo:lista;
begin
 new(nuevo);
 nuevo^.dato:=c2;
 nuevo^.sig:=nil;
 if (l=nil) then 
  l:=nuevo;
 else 
   ult^.sig:= nuevo; 
 ult:=nuevo;

end;

procedure eliminarOrdenado (var l:lista, var exito:boolean, num:lista);
var
act,ant:lista;
begin
exito:false;
act:=l;
while (act <> nil) and (act^.dato.num < num) do begin
ant:=act;
act:=act^.sig;
end;
if (act <> nil) and (act^.dato.num = num) then begin 
exito:=true;
if (l = act) then 
 l:= l^.sig;
else 
 ant^.sig:= act^.sig;
 
 dispose(act);
end;
end;

procedure procesar (var l:lista); 
var
ce:cliente;
ce2:cliente2;
ulti:lista;
vc:contador;
nivelMaxi,nivelMini:string;
maxi,mini:real;
begin
inicializarContador(vc);
maxi:=-9999;
mini:=9999

leerRegistro(ce);
repeat
 if ((impar(ce.dni)=true) then
  agregarAtras(l,ce2,ult);
 
 if ((ce.fecha.anio) < 2000) then 
  vc[ce.nivel]:=vc[ce.nivel] + ce.puntaje;
 

until ((ce.dni ) = 33444555)); 

maxMin(vc,maxi,mini,nivelMaxi,nivelMini); 
writeln(nivelMaxi,nivelMini);

end;


//----------Fin Modulos 
var 
list:lista;
exit:boolean;
nume:lista;
begin 
list:=nil;
procesar(list);
readln(nume); 
eliminarOrdenado(list,exit,nume);
