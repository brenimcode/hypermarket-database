# Gatilhos

## **Procedimento Armazenado**: **Promover Cliente a Categoria Especial**

- Esse procedimento promove automaticamente o cliente para uma nova categoria (como “Diamante”, “Ouro”, etc.) com base no total gasto.

```sql
CREATE OR REPLACE PROCEDURE promover_cliente_categoria(
    p_CPF_Cliente CHAR(11)
)
LANGUAGE plpgsql
AS $$
DECLARE
    total_gasto DECIMAL(10, 2);
    nova_categoria INT;
BEGIN
    -- Calcula o total gasto do cliente somando os valores da tabela Compra
    SELECT COALESCE(SUM(ValorTotal), 0) INTO total_gasto
    FROM Compra
    WHERE CPF_Cliente = p_CPF_Cliente;

    -- Define a nova categoria com base no total gasto
    IF total_gasto >= 1000 THEN
        nova_categoria := 1; -- Diamante
    ELSIF total_gasto >= 800 THEN
        nova_categoria := 2; -- Ouro
    ELSIF total_gasto >= 500 THEN
        nova_categoria := 3; -- Prata
    ELSE
        nova_categoria := 4; -- Comum
    END IF;

    -- Atualiza a categoria do cliente na tabela Cliente
    UPDATE Cliente
    SET idCategoria = nova_categoria
    WHERE CPF_Cliente = p_CPF_Cliente;

    -- Mensagem de confirmação
    RAISE NOTICE 'Cliente % promovido à categoria % com total gasto de %', p_CPF_Cliente, nova_categoria, total_gasto;
END;
$$;
```

- Como usar o procedimento:

```sql
CALL promover_cliente_categoria('42345678900');
```

---