DECLARE
    v_contador NUMBER := 0;

BEGIN
    FOR info IN (SELECT cliente.nom_cliente, cliente.cod_cliente, cliente.num_cpf_cnpj, cliente.tip_pessoa, pedido.cod_pedido, pedido.dat_pedido, pedido.dat_entrega, pedido.val_total_pedido, pedido.status FROM pedido RIGHT JOIN cliente ON pedido.cod_cliente = cliente.cod_cliente) LOOP 
        v_contador := v_contador + 1;
        EXIT WHEN v_contador > 10;
        dbms_output.put_line('Código do Cliente: ' || info.cod_cliente);
        dbms_output.put_line('Nome: ' || info.nom_cliente);
        dbms_output.put_line('Tipo: ' || info.tip_pessoa);
        dbms_output.put_line('Pedido: ' || info.cod_pedido);
        dbms_output.put_line('Data Pedido: ' || info.dat_pedido);
        dbms_output.put_line('Data Entrega: ' || info.dat_entrega);
        dbms_output.put_line('Valor Total: ' || info.val_total_pedido);
        dbms_output.put_line('Status: ' || info.status);
        dbms_output.put_line('CPF/CNPJ: ' || info.num_cpf_cnpj);
    END LOOP;
END;
