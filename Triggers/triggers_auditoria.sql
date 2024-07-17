
                CREATE TRIGGER bodega_insert_audit
                AFTER INSERT ON bodega
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('bodega', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER bodega_update_audit
                AFTER UPDATE ON bodega
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('bodega', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER bodega_delete_audit
                AFTER DELETE ON bodega
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('bodega', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER carrito_compra_insert_audit
                AFTER INSERT ON carrito_compra
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('carrito_compra', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER carrito_compra_update_audit
                AFTER UPDATE ON carrito_compra
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('carrito_compra', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER carrito_compra_delete_audit
                AFTER DELETE ON carrito_compra
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('carrito_compra', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER categoria_empleado_insert_audit
                AFTER INSERT ON categoria_empleado
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('categoria_empleado', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER categoria_empleado_update_audit
                AFTER UPDATE ON categoria_empleado
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('categoria_empleado', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER categoria_empleado_delete_audit
                AFTER DELETE ON categoria_empleado
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('categoria_empleado', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER categoria_producto_insert_audit
                AFTER INSERT ON categoria_producto
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('categoria_producto', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER categoria_producto_update_audit
                AFTER UPDATE ON categoria_producto
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('categoria_producto', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER categoria_producto_delete_audit
                AFTER DELETE ON categoria_producto
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('categoria_producto', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER cliente_insert_audit
                AFTER INSERT ON cliente
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('cliente', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER cliente_update_audit
                AFTER UPDATE ON cliente
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('cliente', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER cliente_delete_audit
                AFTER DELETE ON cliente
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('cliente', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER contrato_insert_audit
                AFTER INSERT ON contrato
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('contrato', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER contrato_update_audit
                AFTER UPDATE ON contrato
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('contrato', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER contrato_delete_audit
                AFTER DELETE ON contrato
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('contrato', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER detalle_factura_insert_audit
                AFTER INSERT ON detalle_factura
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('detalle_factura', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER detalle_factura_update_audit
                AFTER UPDATE ON detalle_factura
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('detalle_factura', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER detalle_factura_delete_audit
                AFTER DELETE ON detalle_factura
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('detalle_factura', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER detalle_producto_insert_audit
                AFTER INSERT ON detalle_producto
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('detalle_producto', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER detalle_producto_update_audit
                AFTER UPDATE ON detalle_producto
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('detalle_producto', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER detalle_producto_delete_audit
                AFTER DELETE ON detalle_producto
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('detalle_producto', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER direccion_entrega_insert_audit
                AFTER INSERT ON direccion_entrega
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('direccion_entrega', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER direccion_entrega_update_audit
                AFTER UPDATE ON direccion_entrega
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('direccion_entrega', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER direccion_entrega_delete_audit
                AFTER DELETE ON direccion_entrega
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('direccion_entrega', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER empleado_insert_audit
                AFTER INSERT ON empleado
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('empleado', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER empleado_update_audit
                AFTER UPDATE ON empleado
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('empleado', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER empleado_delete_audit
                AFTER DELETE ON empleado
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('empleado', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER factura_insert_audit
                AFTER INSERT ON factura
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('factura', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER factura_update_audit
                AFTER UPDATE ON factura
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('factura', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER factura_delete_audit
                AFTER DELETE ON factura
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('factura', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER metodo_pago_insert_audit
                AFTER INSERT ON metodo_pago
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('metodo_pago', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER metodo_pago_update_audit
                AFTER UPDATE ON metodo_pago
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('metodo_pago', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER metodo_pago_delete_audit
                AFTER DELETE ON metodo_pago
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('metodo_pago', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER pasillo_insert_audit
                AFTER INSERT ON pasillo
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('pasillo', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER pasillo_update_audit
                AFTER UPDATE ON pasillo
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('pasillo', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER pasillo_delete_audit
                AFTER DELETE ON pasillo
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('pasillo', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER pedido_insert_audit
                AFTER INSERT ON pedido
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('pedido', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER pedido_update_audit
                AFTER UPDATE ON pedido
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('pedido', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER pedido_delete_audit
                AFTER DELETE ON pedido
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('pedido', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER producto_insert_audit
                AFTER INSERT ON producto
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('producto', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER producto_update_audit
                AFTER UPDATE ON producto
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('producto', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER producto_delete_audit
                AFTER DELETE ON producto
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('producto', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER producto_bodega_insert_audit
                AFTER INSERT ON producto_bodega
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('producto_bodega', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER producto_bodega_update_audit
                AFTER UPDATE ON producto_bodega
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('producto_bodega', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER producto_bodega_delete_audit
                AFTER DELETE ON producto_bodega
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('producto_bodega', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER promociones_insert_audit
                AFTER INSERT ON promociones
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('promociones', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER promociones_update_audit
                AFTER UPDATE ON promociones
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('promociones', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER promociones_delete_audit
                AFTER DELETE ON promociones
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('promociones', NOW(), USER(), 'Datos eliminados');
                END;
                

                CREATE TRIGGER proveedor_insert_audit
                AFTER INSERT ON proveedor
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('proveedor', NOW(), USER(), 'Datos insertados');
                END;
                

                CREATE TRIGGER proveedor_update_audit
                AFTER UPDATE ON proveedor
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('proveedor', NOW(), USER(), 'Datos actualizados');
                END;
                

                CREATE TRIGGER proveedor_delete_audit
                AFTER DELETE ON proveedor
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('proveedor', NOW(), USER(), 'Datos eliminados');
                END;
                
