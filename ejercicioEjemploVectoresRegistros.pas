program practica;

type 
  alumno = record
    nombre: string;
    edad: integer;
  end; 

  vector = array[1..3] of alumno; 
  
procedure leerVector(var v: vector); 
var 
  i: integer;
begin 
  for i := 1 to 3 do 
  begin 
    readln(v[i].nombre);   
    readln(v[i].edad);   
  end;
end;
   
procedure mostrarVector(v: vector);
var
  i: integer;
begin
  for i := 1 to 3 do
    writeln('Nombre: ', v[i].nombre, '  Edad: ', v[i].edad);
end;
  
procedure cambiar(var v: vector); 
begin 
  v[2].edad := 15; 
end; 
  
var 
  ve: vector; 
   
begin 
  leerVector(ve); 
  mostrarVector(ve);
  cambiar(ve);
  mostrarVector(ve);
end.
