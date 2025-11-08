{2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada
(1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código 1122,
el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el cliente
debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente por su
seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}

program ejercicio2; 
const
 df=6; 

type 
 cliente = record 
  cod:integer;
  dni:integer;
  apeNom:string; 
  codPo:rangopo;
  monto:real;
  end;
 rangoPo= 1..df;
 vMontoAdic = array[rangoPo] of real; 
 lista=^nodo;
 nodo= record
  dato:cliente;
  sig:lista;
 end;

// modulos 

procedure LeerRegistro (var c:cliente);
begin 
readln(c.cod);
readln(c.dni);
readln(c.apeNom); 
readln(c.codPo);
readln(c.monto);
end;

procedure almacenar (var L:lista);
var 
 cli:cliente;
 
 begin 
  repeat 
   leerRegistro(cli);
   agregarAdelante(L,cli);
   until ((cli.codigo) = 1122); 
  end; 
  
procedure agregarAdelante (var L:lista, C:cliente); 
var
 nuevo:lista;
begin 
 new(nuevo);
 nuevo^.dato:=c;
 nuevo^.sig:=l; 
 l:=nuevo;
 end; 
 procedure procesarInfo (l:lista, va:vadic); 
 var 
  montoCompleto:real;
 begin 
  while (l <> nil) do begin 
   montoCompleto:=0; 
   informar (montoCompleto, L^.dato, va); 
   dosNueve(L^.dato.dni, L^.dato.apeNom); 
   
   L:= L^.sig;
   end;
   end; 
   
   procedure informar (var montoCom:integer, c:cliente, va:vadic); 
    var 
    monto: real; 
    begin
    monto:= c.monto; 
    writeln(c.dni);
    writeln(c.apeNom);
    montoComp:= (monto + va[c.codPo]);
    writeln(montoComp);
    end; 
    
    procedure dosNueve (dni:integer, ape:string); 
    var 
    dig:integer; 
    conteo:integer; 
    begin 
     conteo:=0;
     while (dni <>0) do begin 
      dig:=dni MOD 10; 
      if (dig = 9) then 
       conteo:= conteo +1; 
      
      dni:= dni div 10; 
       end; 
    if (conteo > 2) then 
     writeln(ape);
    end;
 end; 
 
 procedure eliminar (var l: lista, var dni:integer, var exito:boolean); 
 var 
 act,ant:lista;
 begin 
 exito:=false;
 act:=l; 
 while (act<> nil) and (not exito) do       //arreglar lo de (act<>nil) 
  if (act^.dato.dni =dni) then 
   exito:=true; 
   else begin 
    ant:= act;
    act:= act^.sig;
  end; 
  if (exito) then begin 
   if (l=act) then l:= l^.sig; 
   else ant^.sig:=act^.sig;
   end; 
   dispose (act); 
   end; 
   
 


// modulos 
var 
 list: lista;
 vAdic:vMontoAdic; 
 exit: boolean;
 dni:integer;
 
 begin 
 list:=nil; 
 cargarVector(vAdic) //se dispone
 almacenar(list);
 procesarInfo(list,vAdic); 
 readln(dni); 
 eliminar (list,dni,exit); 
 

