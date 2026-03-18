DECLARE
    v_cliente NUMBER := &valor;

BEGIN
    FOR m_cliente IN (SELECT cliente.cod_cliente, cliente.nom_cliente, cliente.tip_pessoa, cliente.num_cpf_cnpj, cliente.dat_cadastro , AVG(pedido.val_total_pedido) AS media_valor, SUM(pedido.val_total_pedido) AS total_valor FROM cliente INNER JOIN pedido ON cliente.cod_cliente = pedido.cod_cliente WHERE cliente.cod_cliente = v_cliente GROUP BY cliente.cod_cliente, cliente.nom_cliente, cliente.tip_pessoa, cliente.num_cpf_cnpj, cliente.dat_cadastro) LOOP
        dbms_output.put_line('ID do cliente: ' || m_cliente.cod_cliente);
        dbms_output.put_line('Nome: ' || m_cliente.nom_cliente);
        dbms_output.put_line('Tipo: ' || m_cliente.tip_pessoa);
        dbms_output.put_line('CPF/CNPJ: ' || m_cliente.num_cpf_cnpj);
        dbms_output.put_line('Data do cadastro: ' || m_cliente.dat_cadastro);
        dbms_output.put_line('Média de gastos: R$' || round(m_cliente.media_valor, 2));
        dbms_output.put_line('Total de gastos: R$' || round(m_cliente.total_valor, 2));
    END LOOP;
END;
