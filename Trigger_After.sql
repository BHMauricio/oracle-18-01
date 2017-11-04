--Ejemplo de Trigger de tipo After
--Paso #1 crear un archivo sql que se llame disparadores_2.sql

create table primera (id integer primary key, nombre varchar2(60), edad integer);

create table respaldo_menores (id integer, nombre varchar2(60), edad integer);

create table respaldo_mayores (id integer, nombre varchar2(60), edad integer);

--Crear el primer disparador con la primera tabla
create or replace trigger disp_primera after insert on primera for each row
begin
if:new.edad <18 then
insert into respaldo_menores values (:new.id, :new.nombre, :new.edad);
else
insert into respaldo_mayores values (:new.id, :new.nombre, :new.edad);
end if;
end;
/

--Se tiene que comprobar que funcione 
insert into primera values (2,'Ana',17);
select * from primera;
select * from respaldo_mayores;
select * from respaldo_menores;




