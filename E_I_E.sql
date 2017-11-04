--Creamos la primer Tabla
create table pago_honorarios (id integer primary key, subtotal float, iva float, isr float, ret_iva float, total_pagar float);

--crear un bloque pl/sql que llene la tabla antreor con
--Un total de 30 registros con el siguiente formato
--El id se debera incrementar de 1 en 1 hasta 300
--El Iva retencion del iva, isr y total a pagar no deben insertarse
--Solo deberan insertarse el subtotal y este debera incrementarse de 100 en 100 empezando desde 1500

--Crear un procedimiento almacenado para hacer la actualizacion con los datos del subtotal para todos los registros como sigue
--Iva=subtotal*0.16;
--ret_iva=iva/3*2;
--isr=subtotal*0.10;
--total_pagar=subtotal+ret_iva-iva-isr;

--realizar el diagama de un artitectura de un sistema de base de datos distribuido, muestra cada una de los componentes del mismo y escribe una breve explicacion de
--cada una de ellas. 
--Explica cual es la tarea de la capa Controladora, vista y Modelo
--Explica cual es el objetivo principal del mapeo Objetos-Relacional dentro de una arquitectura de base de datos distribuida

create sequence pago_honorarios
start with 1
increment by 1
maxvalue 300;

--El iva retencion del iva, isr y otal a pagar no dene insertarse


create or replace procedure pago_honorarios(my_id out integer, my_subtotal in float)
as
my_iva float;
my_ret_iva float;
my_isr float;

begin

my_iva:=my_subtotal*0.16;
my_ret_iva:=my_iva/3*2;
my_isr:=my_subtotal*.010;

select sec_pago.nextval into id from dual;
insert into pago_honorarios (id,subtotal,iva,ret_va,isr) values (1,subtotal,my_iva,my_ret_iva,my_isr);
end;
/
create or replace procedure genera_tres
as 
begin
for I in 1..300 loop
insert into pago_honoratios(id) values (i);  --para solo incrementar en el que quieres
for
end loop;
end;
/
begin
genera_tres();
end;
/







