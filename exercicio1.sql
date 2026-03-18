DECLARE
    v_cod_produto NUMBER := &codigo;
    v_total NUMBER;
    
BEGIN
    SELECT SUM(qtd_movimentacao_estoque) INTO v_total FROM movimento_estoque WHERE cod_produto = v_cod_produto;
    dbms_output.put_line('Código do produto: ' || v_cod_produto);
    dbms_output.put_line('Total de movimentações: ' || v_total);
END;
