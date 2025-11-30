{ Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva
película, para ello se debe leer y almacenar la información de las personas que desean participar de dicho
casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que
prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega una
persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
Invocar dicho módulo en el programa principal. }

program ejercicio1; 
const 
df=5; 

type 

persona = record
 dni:integer;
 apeNom:string;
 edad:integer;
 cod:rango;
 end;
rango =1..df;
 lista=^nodo;
 nodo= record
  dato:persona;
  sig:lista;
 end;
 vContador = array [rango] of integer;
 
//modulos 

procedure leerRegistro (var p:persona);
begin
 readln(p.dni);
 readln(p.apeNom);
 readln(p.edad);
 readln(p.cod);
 end;
procedure almacenar (var l:lista);
var 
 pe:persona;
 begin
  repeat 
   leerRegistro(pe);
   agregarAdelante(l,pe);
   until ((p.dni) = 33555444); 
 end; 
 procedure agregarAdelante (var l:lista, p:persona); 
 var 
  nuevo:lista;
  begin 
   new(nuevo); 
  nuevo^.dato:=p;
  nuevo^.sig:=l; 
  l:=nuevo;
 end; 
procedure procesarInfo (l:lista, var vc:vContador); 
var 
 cumple:boolean;
 persona:integer;
 cod1cod2:integer;
 cant1,cant2:integer;
 begin
  persona:=0; 
  
  while (l <> nil) do begin 
   if (cumple (l^.dato.dni) =true) 
    persona:= persona +1;
    end; 
   vc[l^.dato.cod]:=vc[l^.dato.cod] +1; 
   
   l:= l^.isg;
  end; 
  maximos(vc,cant1,cant2,cod1,cod2);
 end; 
 procedure inicializarContador (var vCont:vContador); 
 var 
 i:rango; 
 begin 
  for i:=1 to df do begin 
   vc[i]:=0;
   end;
  end; 
 function cumple (dni:integer):boolean; 
  var 
   dni,dig:integer;
   par,impar:integer;
  begin 
   impar:=0;
   dig:=0;
   par:=0;
   while(dni <> 0) do begin 
    dig:= dni mod 10;
    if (dig mod 2=0) then 
     par:= par +1; 
     else 
      impar:= impar + 1; 
    end;
    dni:= dni div10;
     end; 
    if (par > impar) then begin
     cumple:= true;
     end; 
   end;   
 procedure maximos (vc:contador; var can1,can2:integer; var cod1,cod2:integer);
 var 
  i:rango; 
  begin 
   can1:=-1;
   can2:-2;
   for i:=1 to df do begin 
    if (vc[i]>can1) then begin 
     can2:=can1;
     cod2:=cod1;
     can1:=vc[i];
     cod1:=i;
    else  (vc[i]>cand 2) then 
     can2:=vc[i];
     cod2:=i;
    end; 
    end; 
    writeln(cod1,cod2);
    end; 
 procedure eliminar (var l:lista, var exito:boolean, var dni:integer); 
  var 
  act,ant:lista;
  begin
   exito:=false;
   act:=l; 
   while (act <> nil) and (not exito) do 
    if (act^.dato.dni =dni) then exito:=true
    else if begin 
     ant:= act; 
     act:=act^.sig; 
    end; 
    if (exito) then begin 
    
     if(l>act) then l:= l^.sig;
     else if 
      ant^.sig:=act^.sig;
      
      dispose(act);
      end;
      end;
      end; 
      
    

//modulos 

var 
list:lista;
vCont:vContador;
elDni:integer;
vExito:integer; 

begin
list:=nil;
inicializarCont(vCont);
almacenar(list);
procesarInfo(list,vCont);
readln(elDni);
eliminar(list,vExito,elDni);
end;
