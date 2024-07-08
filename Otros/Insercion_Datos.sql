-- Insertar datos en direccion_entrega
INSERT INTO direccion_entrega (calle, ciudad, estado, codigo_postal)
VALUES 
('Calle 1', 'Ciudad A', 'Estado X', '12345'),
('Calle 2', 'Ciudad B', 'Estado Y', '67890'),
('Calle 3', 'Ciudad C', 'Estado Z', '11223');

-- Insertar datos en pedido
INSERT INTO pedido (fecha_pedido, direccion_entrega_id)
VALUES 
('2023-01-01', 1),
('2023-02-15', 2),
('2023-03-10', 3);

-- Insertar datos en cliente
INSERT INTO cliente (nombre, apellido, email, cedula, telefono)
VALUES 
('Juan', 'Perez', 'juan.perez@example.com', '1234567890', '555-1234'),
('Ana', 'Garcia', 'ana.garcia@example.com', '0987654321', '555-5678'),
('Luis', 'Lopez', 'luis.lopez@example.com', '1122334455', '555-8765');

-- Insertar datos en carrito_compra
INSERT INTO carrito_compra (cliente_id, pedido_id)
VALUES 
(1, 1),
(2, 2),
(3, 3);

-- Insertar datos en categoria_empleado
INSERT INTO categoria_empleado (nombre, descripcion)
VALUES 
('Gerente', 'Encargado de la gestión general'),
('Vendedor', 'Encargado de la atención al cliente'),
('Repartidor', 'Encargado de la entrega de productos');

-- Insertar datos en empleado
INSERT INTO empleado (nombre, apellido, cargo, salario, fecha_contrato, categoria_id)
VALUES 
('Carlos', 'Diaz', 'Gerente General', 5000.00, '2022-01-01', 1),
('Maria', 'Fernandez', 'Vendedora', 3000.00, '2023-03-01', 2),
('Pedro', 'Martinez', 'Repartidor', 2500.00, '2023-05-01', 3);

-- Insertar datos en promociones
INSERT INTO promociones (nombre, descripcion, fecha_inicio, fecha_fin, descuento)
VALUES 
('Descuento de Primavera', '20% de descuento en productos seleccionados', '2023-03-21', '2023-06-21', 20.00),
('Black Friday', '50% de descuento en toda la tienda', '2023-11-25', '2023-11-25', 50.00),
('Navidad', '30% de descuento en productos de temporada', '2023-12-20', '2023-12-25', 30.00);

-- Insertar datos en factura
INSERT INTO factura (fecha_factura, total, cliente_id, empleado_id, promociones_id)
VALUES 
('2023-01-05', 150.00, 1, 1, 1),
('2023-02-20', 200.00, 2, 2, 2),
('2023-03-15', 250.00, 3, 3, 3);

-- Insertar datos en contrato
INSERT INTO contrato (empleado_id, tipo_contrato, fecha_inicio, fecha_fin, salario)
VALUES 
(1, 'Indefinido', '2022-01-01', '2025-01-01', 5000.00),
(2, 'Temporal', '2023-03-01', '2024-03-01', 3000.00),
(3, 'Por Proyecto', '2023-05-01', '2023-12-01', 2500.00);

-- Insertar datos en metodo_pago
INSERT INTO metodo_pago (nombre, descripcion)
VALUES 
('Tarjeta de Crédito', 'Pago con tarjeta de crédito'),
('PayPal', 'Pago a través de PayPal'),
('Transferencia Bancaria', 'Pago mediante transferencia bancaria');

-- Insertar datos en categoria_producto
INSERT INTO categoria_producto (nombre, descripcion)
VALUES 
('Electrónica', 'Productos electrónicos y gadgets'),
('Hogar', 'Artículos para el hogar y cocina'),
('Ropa', 'Prendas de vestir y accesorios');

-- Insertar datos en proveedor
INSERT INTO proveedor (nombre, contacto, telefono, email)
VALUES 
('Proveedor A', 'Contacto A', '555-1234', 'contactoA@example.com'),
('Proveedor B', 'Contacto B', '555-5678', 'contactoB@example.com'),
('Proveedor C', 'Contacto C', '555-8765', 'contactoC@example.com');

-- Insertar datos en producto
INSERT INTO producto (proveedor_id, nombre, descripcion, precio, categoria_id)
VALUES 
(1, 'Smartphone', 'Último modelo de smartphone', 700.00, 1),
(2, 'Sartén', 'Sartén antiadherente', 30.00, 2),
(3, 'Camiseta', 'Camiseta de algodón', 20.00, 3);

-- Insertar datos en detalle_factura
INSERT INTO detalle_factura (factura_id, producto_id, metodo_id, cantidad, precio_unitario)
VALUES 
(1, 1, 1, 1, 700.00),
(2, 2, 2, 2, 30.00),
(3, 3, 3, 3, 20.00);

-- Insertar datos en pasillo
INSERT INTO pasillo (nombre)
VALUES 
('Electrónica'),
('Hogar'),
('Ropa');

-- Insertar datos en detalle_producto
INSERT INTO detalle_producto (producto_id, pasillo_id, fecha_ingreso, cantidad, precio_compra)
VALUES 
(1, 1, '2023-01-01', 50, 600.00),
(2, 2, '2023-02-01', 100, 25.00),
(3, 3, '2023-03-01', 200, 15.00);

-- Insertar datos en bodega
INSERT INTO bodega (nombre, direccion, ciudad, estado, codigo_postal)
VALUES 
('Bodega Central', 'Calle 1', 'Ciudad A', 'Estado X', '12345'),
('Bodega Norte', 'Calle 2', 'Ciudad B', 'Estado Y', '67890'),
('Bodega Sur', 'Calle 3', 'Ciudad C', 'Estado Z', '11223');

-- Insertar datos en producto_bodega
INSERT INTO producto_bodega (producto_id, bodega_id, cantidad)
VALUES 
(1, 1, 50),
(2, 2, 100),
(3, 3, 200);
