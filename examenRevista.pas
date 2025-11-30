{CADP 2023 – Parcial TEMA 1 – Tercera Fecha (15/7/2023)

Una revista deportiva dispone de información de los jugadores de fútbol participantes de la liga profesional 2022. De cada jugador se conoce: código de jugador,
 apellido y nombres, código de equipo (1..28), año de nacimiento y la calificación obtenida para cada una de las 27 fechas del torneo ya finalizado.
La calificación es numérica de 0 a 10, donde el valor 0 significa que el jugador no ha participado de la fecha.

Se solicita:

a. Informar para cada equipo la cantidad de jugadores mayores a 35 años.

b. Informar los códigos de los 2 jugadores con mejor calificación promedio en los partidos en los que participó.
Solo deben considerarse los jugadores que participaron en más de 14 fechas.

c. (COMPLETO) Implementar e invocar a un módulo que genere una lista con los jugadores cuyo código posee exactamente 3 dígitos impares y que haya nacido entre 1983 y 1990.
La lista debe estar ordenada por código de jugador. }

program parcial; 
const 
dfe =28;
dfc =10;
dff =27;
type 
ranEqui =1..dfe;
ranCalifi = 0..dfc;
ranFechas = 1..dff;
cadena20 = string[20]; 

jugador = record 
 cod:integer; 
 apeNom:cadena20; 
 codEquipo:ranEqui; 
 anio:integer;
 califica: vectorCalifi; 
 end; 
 vectorCalifi = array [ranFechas] of ranCalifi; 
 vecContaEquipo = array [ ranEqui ] of integer; 

lista =^nodo;
nodo = record 
 dato: jugador;
 sig:lista;
 end; 
 //------------ modulos 
 procedure incializarContador (var vce:veContaEquipo); 
 var 
 i:ranEqui; 
 begin 
  for i:=1 to dfe do begin 
   vce[i]:=0; 
   end; 
   end; 
   
   procedure recorrerContador (vce:veContaEquipo); 
    var 
 i:ranEqui; 
 begin 
  for i:=1 to dfe do begin 
  writeln('equipo:',  i); 
  writeln(vce[i]); 
   end; 
   end; 
   
   function recorrerCalificaciones (vc:vecCalifi): boolean; 
   var 
    i:ranCalifi; 
    comprobar: integer; 
    begin 
    comprobar:= 0; 
     for i:=1 to dfc do begin 
     if (vc[i] <> 0) then 
     comprobar:= comprobar +1; 
     end;
    
    if comprobar > 14 then 
     recorrerCalificaciones:=true; 
     else 
      recorrerCalificaciones:=false; 
    
    end; 
    
    procedure maximos (var max1,max2:real; cod1,cod2:integer; promedio:real;codActual:integer;); 
   
    begin 
 
    if (promedio > max1) then begin 
     max2:=max1; 
     cod2:=cod1; 
     max1:=promedio; 
     cod1:=codActual; 
     else if (promedio > max2) 
      max2:=promedio;
      cod2:=codActual; 
      
      end;
  
    end; 
 procedure insertarOdenado (var l2:lista, j:jugador);
 var 
 nuevo, ant,act:lista;
 
 begin 
 new (nuevo);
 nuevo^.dato:=j; 
 ant:=l2;
 act:=l2; 
 while (act <> nil) and (l^.dato.cod < j.cod) do begin 
     ant:=act; 
     act:=act^.sig;
 end; 
if (act = ant) then begin
     l2:= nuevo; 
 else 
     ant^.sig:=nuevo; 
nuevo^.sig:=act;
 end;
 end; 
 
 
 function impar (var cod:integer):boolean; 
 var 
 dig,cumple:integer;
 begin
 dig:=0;
 cumple:=0;

while (cod <> 0) do begin 
 dig:= cod mod 10; 
 if (cod mod 2:= 1) then 
 cumple:= cumple +1; 
 end; 
 cod:= cod div 10;
end; 

if (cumple > 3) then begin
impar:= true;
else
impar:=false;
end;
 
 end;
 
 procedure generarListaNueva (l:lista, var l2:lista);
 begin 
 while (l <>nil) do begin 
  if ((impar(l^.dato.cod) = true) and ( ( l^.dato.anio > 1983 ) and ( l^.dato.anio < 1990 )) then begin 
   insertarOdenado(l2,l^.dato); 
   l:= l^.sig; 
 end; 
 
 end;
 end; 
 procedure procesarDatos (l:lista, vc:vectorCalifi); 
 var 
 vceq:vecContaEquipo; 
 maxi1,maxi2:real;
 codigo1,codigo2:integer; 
  i: ranCalifi; 
 suma:real;
 partidos:integer;
 promedios:=real;
 
 
 begin 
  inicializarVector(vecq); 
  maxi1:=-1;
  maxi2:-1; 
 
  while (l <> nil) do begin 
    suma:=0; 
   partidos:=0;
    for i:=1 to dfc do begin 
     if ( (v[i]) <> 0) then 
     suma:= suma + v[i]; 
     partidos:= partidos +1;
    end;
    promedios:= (suma/partidos); 
  if ((l^.dato.anio) < 1990) then begin 
   vceq[l^.dato.codEqui]:= vceq[l^.dato.codEqui] +1; 
   end; 
   
   if ((recorrerCalificaciones(vc)) = true ) then 
   maximos(maxi1,maxi2,codigo1,codigo2,promedios,l^.dato.cod);


  L:= L^.sig;
 end; 
 recorrerContador(vceq);
 writeln(cod1,cod2); 
 
 
 end; 
 
 
 //------------- fin modulos 
 var 
 list : lista; 
 list2:lista; 
 vec:vectorCalifi; 
 
 begin 
 list:=nil; //se dispone 
 list2:=nil;
 cargarLista(list); //se dispone
 procesarDatos(list,vec); 
 generarListaNueva(list,list2); 
 
end;

