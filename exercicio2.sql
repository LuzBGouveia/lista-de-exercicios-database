DECLARE
    v_cliente_id NUMBER := &codigo;
    v_soma number := 0;
    v_quantidade number := 0;
    v_media number;

BEGIN
    FOR registro IN (SELECT val_total_pedido FROM historico_pedido WHERE cod_cliente = v_cliente_id) LOOP
        v_soma := v_soma + registro.val_total_pedido;
        v_quantidade := v_quantidade + 1;
    END LOOP;
    v_media := v_soma / v_quantidade;
    
    dbms_output.put_line('Média dos pedidos: ' || round(v_media, 2));
END;
