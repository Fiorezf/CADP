{6. El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas, 2:
planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su
descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido observados.
Dicha información se lee hasta encontrar un objeto con código -1 (el cual no debe procesarse). La
estructura generada debe mantener el orden en que fueron leídos los datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.}

program ejercicioSeis; 
const
df=7;
type 
rango=1..df;
objeto= record 
 cod:integer;
 cat:rango;
 nom:string;
 dist:real;
 nomDe:string;
 anio:integer;
 end;
 lista=^nodo;
 nodo = record 
  dato:objeto;
  sig:lista; 
  end; 
  vContador=array [rango ] of integer;
  // modulos-----------------------
  procedure leerRegistro (var o:objeto); 
  begin
  readln(o.cod);
  if ((o.cod)<> -1) then begin 
  readln(o.cat);
  readln(o.nom);
  readln(o.dist);
  readln(o.nomDe);
  readln(o.anio);
  end;
  end;
  
  procedure agregarAtras (var l:lista, var ult: lista, o:objeto); 
  var 
  nuevo:lista;
  begin 
  new(nuevo); 
  nuevo^.dato:=o;
  nuevo^.sig:=nil;
  if (l = nil) then 
   l:=nuevo; 
  else 
   ult^.sig:=nuevo;
   ult:=nuevo; 
  end; 
 procedure almacenar (var l:lista); 
 var 
 ob:objeto; 
 ulti:lista; 
 begin
 leerRegistro(ob); 
 while ((ob.cod)<> -1) do begin 
  agregarAtras(l,ult, ob); 
  leerRegistro(ob);
  end; 
  end; 
  
  procedure recorrerVector (vc:vContador); 
  var 
  i:integer;
  begin 
  for :=1 to df do begin 
   vc[i]:=0;
   end;
   end; 
   
   funcion check2 (nomDe:string, anio:integer, cat:rango):boolean;
   begin 
   if (cat = 2) then begin 
    if (nomDe = "galileo galilei") and (anio < 1600) then 
    check2:=true; 
    end; 
    check2:=false;
    end;
    
    procedure maximos (var co1,co2:integer; var max1,max2:real, codActual:integer;distAct:real); 
    begin 
    if (distAct > max1) then begin 
    max2:=max1; 
    cod2:=cod1;
    maxi1:=distAct; 
    cod1:=codActual; 
    else if (distAct > max2) then begin 
    max2:= distAct; 
    cod2:=codActual; 
    end; 
    end; 
    end; 
    function parImpar (cod:integer):boolean; 
    var 
    dig:integer;
    par,impar:integer;
    begin 
    par:=0;
    impar:=0;
    
    while (cod <> 0) do begin 
    dig:= cod mod 10; 
    if ((dif mod 2) =0) then begin
    par:= par +1;
    else  if 
    impar:=impar +1; 
    end; 
    
    cod: cod div 10; 
    end; 
    if (par > impar) then begin 
    parImpar:= true; 
    else 
    parImpar:=false; 
    end; 
    
  end; 
  
  
  procedure procesarDatos (l:lista); 
  var 
  cantPlanetas:integer;
  vco:vContador; 
  cod1,cod2:integer;
  maxi1,maxi2:real;
 
  begin
  cantPlanetas:=0;
  inicializarCont(vco); 
  maxi1:=-1;
  maxi2:=-1;
  
  while ( l <> nil) do begin 
  
  maximos (cod1,cod2,maxi1,maxi2,l^.dato.cod,l^.dato.dist); //punto1 
  
  if((check2(l^.dato.nomDe,l^.dato.anio,l^.dato.cat) = true) then //punto2
   cantPlanetas:=cantPlanetas +1;
   
  vco[l^.dato.cat]:=vco[l^.dato.cat]+1; //punto 3
  
  if ((l^.dato.cat) =1) then begin 
  if ((parImpar(l^.dato.cod) =true) then 
  writeln(l^.dato.nom); 
  end;
  l:=l^.sig; 
  end; 
  writeln(cod1,cod2,cantPlanetas); 
  recorrerVector(vco);
  
  end;
  
  
  //modulos fin --------------------
  var 
  list: lista;

begin 
list:=nil; 
almacenar(list);
procesarDatos(list); 

end;   
  
