--ponemos primero el serveroutput on
set serveroutput on;

--agregamos un bloque pl sql
declare
dia char (80);
fecha date;
begin
--inicializamos los datos con las funciones siguientes
fecha:=sysdate; --:= se utiliza para asignacion 
dia:=to_char(sysdate,'dd-month-yyyy');
dia:=to_char (sysdate , 'dd');
dia:=to_char(sysdate , 'month');
dia:=to_char (sysdate , 'day');
dia:=to_char (sysdate,'MI');
dia:=to_char (sysdate,'YYYY');
dbms_output.put_line('la fecha es '||dia);
end;
/

--Generar un disparador uqe impida que los usuarios se guarden el dia miercoles 
 
 create table usuario_tiempo(id integer primary key, nombre varchar2(80), edad integer);
create or replace trigger disp_tiempo before insert on usuario_tiempo for each row
begin
if upper(to_char(sysdate, 'day'))=upper('miércoles') then
dbms_output.put_line('El dia es'||to_char(sysdate,'day'));
raise_application_error (-20000,'no puedes guardar en miercoles');
end if;
end;
/
 insert into usuario_tiempo values(7,'mauricio',20);
 
 --Otro ejercicio
 --Generar tabla
 create table usuario_checador(nombre varchar2(80));
 --Generar un disparador que impida guardar en los segundos del 11 al 59 de cada minuto 
 create or replace trigger disp_checador before insert on usuario_checador for each row
 begin 
 dbms_output.put_line('el segundo es ' || to_char(sysdate,'ss'));
 if to_char (sysdate,'ss') >10 then
 raise_application_error (-20001, 'lo siento esta fuera de rango');
 end if;
 end;
 /
 insert into usuario_checador values ('Mauricio')
 