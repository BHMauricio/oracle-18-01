































create table usuario_x (id integer primary key, nombre varchar2(40), edad integer);

insert into usuario_x values (1,'mauricio',21);
insert into usuario_x values (2,'Erick',30);
insert into usuario_x values (3,'Pedro',40);
insert into usuario_x values (4,'Xadia',20);

select * from usuario_x;
--Imprimir las cosas en la consola y es un depurador 
set serveroutput on;

-- Se ingresa el primer cursor

declare
cursor cur_1 is select * from usuario_x;
begin
--logica del cursor
for fila in cur_1 loop
dbms_output.put_line('el nombre actual es ' || fila.nombre);
end loop;
end;
/

--generar un cursor que contenga una variable interna y que realice la siguiente operacion si la edad es estrictamente mayor a 30
--asignar sueldo base un factor de 1.5 y si es menor, no asignar el factor donde Sueldo_base=6000 pesos. 

declare
cursor cur_2 is select * from usuario_x;
sueldo_base integer;
begin
--aqui inicializamos el sueldo base
for fila in cur_2 loop
sueldo_base:=6000;
if fila.edad  >30 then
sueldo_base:=sueldo_base*1.5;
end if;

dbms_output.put_line('El sueldo es ' || sueldo_base || ' edad: '|| fila.edad);
end loop;
end;
/



















