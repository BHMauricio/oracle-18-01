--Clase del Sabado 07/10/2017
create table almacen (numero_almacen integer, ubicacion_almacen varchar2(80),
            constraint pk_na primary key (numero_almacen));
            
--Procedimiento almacenado para guardar una entidad o registro de tipo Almacen 
  create or replace procedure guardar_almacen( mi_id IN integer, mi_ubicacion in varchar2)
  as
  begin
--Aqui la logica del procedimiento 
  insert into almacen values (mi_id, mi_ubicacion);
  end;
  /

--Vamos a probar que funciona nuestro procedimiento
  begin 
  guardar_almacen (4,'FARGO');
  end;
  /
  
  select * from almacen;
  


