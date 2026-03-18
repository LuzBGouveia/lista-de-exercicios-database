DECLARE
    v_cod_produto number := &codigo;
    v_total number;

BEGIN
    SELECT SUM(me.qtd_movimentacao_estoque) INTO v_total 
        FROM tipo_movimento_estoque tme INNER JOIN  movimento_estoque me ON tme.cod_tipo_movimento_estoque = me.cod_tipo_movimento_estoque
    WHERE me.cod_produto = v_cod_produto;
    dbms_output.put_line('Código do produto ' || v_cod_produto);
    dbms_output.put_line('Movimentações: ' || v_total);
END;
