DECLARE
    v_lista varchar2(4000) := '';

BEGIN
    FOR produtos IN (SELECT cod_produto FROM produto WHERE sta_ativo = 'Ativo' ORDER BY cod_produto) LOOP
        IF v_lista IS NULL OR v_lista = '' THEN
            v_lista := produtos.cod_produto;
        ELSE
            v_lista := v_lista || ', ' || produtos.cod_produto;
        END IF;
    END LOOP;
END;
