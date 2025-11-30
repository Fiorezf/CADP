{ 12. El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que ofrece:
1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla con
información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se conoce el
nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una sola suscripción.
La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a CrossFit o a
Todas las clases. Esta lista debe estar ordenada por DNI.} 

program ejercicio12; 
const 
tipo=4;
type 
cadena10=string[10];
raTipo=1..tipo; 

cliente = record 
 nombre:cadena10;
 dni:integer;
 edad:integer;
 susc:raTipo;
 end;
lista=^nodo; 
nodo = record 
 dato:cliente; 
 sig:lista;
 end; 
 cliente2=record
  nombre:cadena10;
  dni:integer;
  end; 
lista2=^nodo;
nodo2=record
 dato:cliente2;
 sig:lista2;
 end; 
 costoMensual=array[raTipo] of real; 
 contador=array[raTipo] of integer; 
 
 //---------------modulos 
 procedure leerRegistro (var c:cliente); 
  begin 
  readln(c.dni);
  if ((c.dni)<> 0 ) then begin
  readln(c.nombre);
  readln(c.edad);
  readln(c.susc); 
  end; 
  end; 
 
 procedure cargarLista(var l:lista); 
 var 
  ce:cliente;
  ulti:lista; 
 begin 
  leerRegistro(ce); 
  while ((ce.dni)<>0) do begin 
  agregarAtras(l,ulti,ce)
  leerRegistro(ce);
  end;
  end;
 
 procedure agregarAtras (var l:lista, ulti:lista, c:cliente); 
 var 
  nuevo:lista; 
 begin 
  new(nuevo); 
  nuevo^.dato:=c;
  nuevo^.sig:=nil; 
  if (l=nil) then begin
   l:=nuevo; 
   else 
    ult^.sig:=nuevo; 
   ult:=nuevo; 
 end;
 
 end; 
 
 procedure Maximos (var max1,max2:integer; var susc1,susc2:string ; vco:contador); 
 var 
  i:raTipo;
 begin 
  
  for i:=1 to tipo do begin
   if (vco[i] > max1) then begin 
    max2:=max1; 
    susc2:=susc1; 
    max1:=vco[i]; 
    susc1:=i; 
   else if (vco[i] > max2) then 
    max2:=vco[i];
    susc2:=i; 
  
  end;
 
end; 
 end; 
 
 procedure inicializarVector(var vco:contador); 
 var 
  i:raTipo; 
 begin 
  for i:=1 to tipo do begin 
   vco[i]:= 0; 
  end; 
 end;
 
 
 procedure insertarOrdenado (var l2:lista2, c2:cliente2); 
 var 
 nuevo,ant,act:lista2;
  
 begin 
  new(nuevo); 
  nuevo^.dato:=c2; 
  ant:=l2; 
  act:=l2; 
  while (act <> nil) and ( act^.dato.sni < c2.dni) do begin 
  ant:= act; 
  act:= act^.sig; 
  end; 
  
  if (act = ant) then begin
   l2:=nuevo; 
  else 
   ant^.sig:=nuevo; 
  nuevo^.sig:= act; 
 end; 
 end;
 
 procedure generarLista (var l2:lista2, l:lista); 
 var 
  ce2:cliente2; 
 begin 
 while (l <> nil) do begin 
  if (l^.dato.edad > 40) and (((l^.dato.susc) = 3) or ((l^.dato.susc) = 4)) then 
  ce2.nombre:=l^.dato.nombre; 
  ce2.dni:=l^.dato.dni; 
  insertarOrdenado(l2,ce2); 
  end; 
  l:=l^.sig;

 end;
 
 
 end; 
 
 procedure procesarDatos ( l:lista, vc:costoMensual); 
 var 
 montoTotal:real;
 maxi1,maxi2:integer,
 suscrip1,suscrip2:=string; 
 veContador:contador;
 
 begin
 montoTotal:=0;
 maxi1:=-9999;
 maxi2:=-9999; 
 incializarVector(veContador);
 while (l <> nil) do begin 
  montoTotal:= montoTotal + vc[l^.dato.susc]; 
  veContador[l^.dato.susc]:=veContador[l^.dato.susc] +1; 
  
  l:=l^.sig;
end;
 maximos(maxi1,maxi2,suscrip1,suscrip2,veContador); 
 writeln(suscrip1,suscrip2); 
 
 end; 
 
 
 //----------fin modulos
 var
 list:lista;
 list2:lista2;
 vec:costoMensual;
  
 
 begin 
 list:=nil; 
 list2:=nil; 
 cargarVector(vec); //se dispone
 cargarLista(list);
 procesarDatos(list,vec); 
 generarLista(list2,list); 
 
 end;
 
 
