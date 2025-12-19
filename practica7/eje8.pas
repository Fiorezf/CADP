{Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la administración de
transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de Enero y Noviembre del año
2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
2
Práctica 7 – Repaso CADP 2025
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la transferencia (1:
alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). Esta estructura no posee
orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las que
las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe estar
ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales
el número de cuenta destino posea menos dígitos pares que impares.}

type 
 motiv = 1..7;
 rMes=1..12;

transferencia = record 
 numOri:integer;
 dniOri:integer;
 numDest:integer;
 dniDest:integer;
 fecha:rFecha;
 hora:integer;
 monto:real;
 cod:motiv;
 end;
 lista=^nodo;
 nodo=record 
  dato:transferencia;
  sig:lista;
  end;
  rFecha=record
   mes:rMes;
   dia:integer;
  end;
  vecContador=array[motiv] of integer; 
  
  var 
   lista1:lista; //se dispone 
   lista2:lista;
   
   //------- Modulos -----------
   
   procedure insertarOrdenado (var l2:lista, t:transferencia); 
   var 
    nuevo, ant, act: l2; 
   begin 
    new(nuevo); 
    nuevo^.dato:=t; 
    ant:=l2;
    act:=l2;
    while (act<>nil) and (act^.dato.numOri < t.numOri) do begin 
     ant:=act;
     act:= act^.sig; 
     end; 
   if (act = ant) then begin 
    l2:=nuevo;
    else 
    ant^.sig:=nue; 
   end; 
   nuevo^.sig:=ant; 
   end; 
   
   procedure maximo (var co1:integer, var max1:real, vc:veContador);
    var 
     i:motiv; 
     begin 
      for i:= 1 to 7 do begin 
       if (vc[i]>max1 then  begin 
        max1:=vc[i]; 
        co1:=i; 
        end; 
      end; 
     
     end; 
   
   procedure inicializarContador (var vc: vecContador); 
   var 
    i:motiv; 
   begin
   
   for i:= 1 to 7 do begin 
   
   vc[i]:=0; 
   
   end; 
   
   
   end; 
   
   
   function digitos (cuentaDest:integer):boolean 
   var 
    par, impar:integer; 
   begin
    par:=0;
    impar:=0; 
    while (cuentaDest <> 0) do begin 
     dig:=cuentaDest MOD 10; 
     if (dig MOD 2 = 0 ) then begin 
      par:= par + 1
     else if (dig MOD 2 = 1) then 
      impar:= impar + 1; 
     end; 
     cuentaDest:= cuentaDest div 10; 
     end; 
    if ( par < impar) then 
    digitos:= true; 
    
    
    
    end; 
   
   
   
   
   end; 
   
   
   procedure procesar (l1:lista, var l2:lista); 
   var 
   cuentaAct:integer;
   montoTotal:real;
   cod1:integer;
   maxi1:real;
   veCont:veContador;
   contador:integer;
   begin
   inicializarVector(veCont);
   contador:=0;
   maxi1:=-1; 
   
   while (l1 <> nil) do begin 
    
    if (l2^.dato.numOri <> l2.dato.numDest) then begin // poner en un procedure cargar lista
     insertarOrdenado(l2, l2^.dato); 
     l1:=l1^.sig; 
    end;
 
   end; 
   
   
   while (l2 <> nil) do begin 
    cuentaAct:= l2^.dato.numOri;
    montoTotal:=0; 
    
    while (l2<>nil) and (cuentaActual = l2^.dato.numOri) do begin 
    
    montoTotal:= montoTotal + l2^.dato.monto; 
    veCont[l^.dato.cod] := veCont[l^.dato.cod] +1; 
    if ((l^.dato.fecha.mes) = 6) then begin 
     if ((digitos (l2^.dato.numDest) = true) then 
      contador:= contador +1; 
    end; 
   l2:= l2^.sig;
   
   end; 
   writeln(montoTotal); 
   end; 
   maximo(cod1,maxi1,veCont);
   writeln(cod1);
   writeln(contador); 
  
   
   end; 
   
   //------ Fin Modulos ------------
   

   begin 
    lista1:=nil; 
    lista2:=nil; 
    cargarLista(lista1); //se dispone; 
    procesar(lista1,lista2); 
    
   end; 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
