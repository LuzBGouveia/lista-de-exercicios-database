DECLARE

BEGIN
    FOR produtos IN (SELECT prod_comp.cod_produto,
            SUM(estoq_prod.qtd_produto) AS total_estoque
        FROM produto_composto prod_comp LEFT JOIN estoque_produto estoq_prod 
            ON prod_comp.cod_produto = estoq_prod.cod_produto
        GROUP BY prod_comp.cod_produto) LOOP
        
        dbms_output.put_line('Código do produto: ' || produtos.cod_produto);
        dbms_output.put_line('Estoque: ' || produtos.total_estoque);
    END LOOP;
END;
