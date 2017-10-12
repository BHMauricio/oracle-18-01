--Clase del Miercoles 11/10/2017
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
  guardar_almacen (1,'Plymouth');
  end;
  /
  
  select * from almacen;
  
  --Creamos la tabla vendedor 

create table vendedor (numero_vendedor integer,
                      nombre_vendedor varchar2 (60),
                      area_ventas varchar2 (60),
            constraint pk_nv primary key (numero_vendedor)
            );
            
  DESCRIBE almacen;
  describe vendedor;
  
  --Creamos la tabla cliente
  create table cliente(numero_cliente integer,
  numero_almacen integer,
  nombre_cliente varchar2 (60),
  constraint pk_nc primary key (numero_cliente),
  constraint fk1_na foreign key (numero_almacen) references almacen (numero_almacen)
  );
  
  --Creamos la tabla ventas
  create table ventas (id_ventas integer, numero_cliente integer, numero_vendedor integer,monto_venta float (126),
    constraint pk_ven primary key (id_ventas),
    
    constraint fk1_cliente foreign key (numero_cliente) references cliente (numero_cliente),
    
    constraint fk2_vendedor foreign key (numero_vendedor)  references vendedor (numero_vendedor)
  );
  
  --almacen y vendedor
  
--pk artificial (Estos se generan automaticamente en Oracle se agregan en la tabla ventas por medio de una secuencia )
  
  