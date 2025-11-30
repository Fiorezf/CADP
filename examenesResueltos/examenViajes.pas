{Una empresa de colectivos desea procesar información sobre las ventas de pasajes para los 200 viajes que ofrece. Para ello, dispone de una estructura de datos que posee la cantidad de asientos libres de cada uno de sus 200 viajes.

Se pide realizar un programa que:

A. Lea y almacene la información de las ventas de pasajes en una estructura de datos adecuada. De cada venta se lee: código identificador, fecha, si fue online o en boletería, DNI del comprador, código de viaje (1..200), cantidad de pasajes y monto total. La lectura finaliza cuando se lee el DNI 0 (cero), que no debe procesarse. Esta información debe quedar almacenada, de manera ordenada, por el DNI del comprador. Un mismo DNI puede aparecer más de una vez.

B. A partir de la estructura generada en el punto A:

Informe, para cada comprador, su DNI y la cantidad total de pasajes que compró por boletería.

Actualice la estructura que se dispone e informe la cantidad de vuelos que quedaron con asientos libres.

Nota: la estructura generada se debe recorrer una vez. }


program viajes; 
const 
df=200; 

type 
rViaje = 1..df; 
rMes = 1..12; 
rDia = 1..31; 

venta = record
cod:integer; 
fecha:reFecha; 
opcion:boolean;
dni:integer;
cod:rViaje;
cantPasaj:integer;
monto:real;
end; 
reFecha = record 
mes:rMes;
dia:rDia;
anio:integer;
end; 
asientoLibre= array [rViaje] of integer; 

 lista=^nodo;
 nodo= record
  dato:venta;
  sig:lista;
 end;

procedure leerRegistro (var v:venta); 
begin 
readln(v.dni); 
if ((v.dni) <> 0) then begin 
 readln(v.cod);
 readln(v.opcion);
 readln(v.cod); 
 readln(v.cantPasaj);
 readln(v.monto)
 readln(v.fecha.mes);
 readln(v.fecha.dia);
 readln(v.fecha.anio);
 end;
 end;
 
 procedure intertarOrdenado ( var l:lista; v:venta); 
 var
 nuevo, ant, act: lista; 
 
 begin 
 new(nuevo);
 nuevo^dato:=v;
 ant:=l;
 act:=l;
 while (act <> nil) and (act^.dato.dni < v.dni) do begin 
 ant:=act;
 act:=act^.sig;
 end;
 
 if (act = ant) then 
  L:= nuevo; 
 else 
 ant^.sig:=nuevo; 
 nuevo^.sig:=actual
 end; 
 
 procedure cargarLista (var l:lista);
 var 
 ve:venta;
 begin 
 leerRegistro(ve); 
 while (ve.dni <> 0) do begin 
 insertarOrdenado(l,ve); 
 leerRegistro(ve);
 end;
 end;

procedure vuelos (vc:asientoLibre); 
var
i:rViaje; 
begin 
for i:=1 to df do begin 
 if (v[i]>0) then 
 suma:= suma +1; 
 end; 
 end; 
 
 
 procedure recorrerLista ( l:lista, var vc:asientoLibre);
 var 
 totPasajes:integer;
 suma:integer; 
 
 begin 
 suma:=0; 
 
 while ( l<>nil) do begin
 compradorActual:=l^.dato.dni; 
 totPasajes:=0; 
 while(l<>dni) and (compradorActual = l^.dato.dni) do begin 
 if ((l^.dato.opcion) = true) then 
 totPasajes:= totPasajes + l^.dato.cantPasajes; 
 end; 
 vc[l^.dato.cod]:= vc[l^.dato.cod] - l^.dato.cantPasajes;
 l:=l^.sig; 
 end; 
 writeln(l^.dato.dni); 
 writeln(totPasajes); 
 vuelos(vc); 
  L:= L^.sig;
 end; 
 writeln(suma); 
 end; 
 
 var 
 list:lista;
 vec:asientoLibre; 
 begin 
 list:=nil; 
 cargarVector(vec); //se dispone. 
 cargarLista(list); 
 recorrerLista(list,vec); 
 end;
 
 


