# Consultas

## 1. **Listar os 5 produtos mais vendidos de todos os tempos (baseado nas quantidades compradas):**

```sql
SELECT Produto.Descricao, SUM(Carrinho.Quantidade) AS Quantidade_Vendida
FROM Produto
JOIN Carrinho ON Produto.idProduto = Carrinho.idProduto
GROUP BY Produto.Descricao
ORDER BY Quantidade_Vendida DESC
LIMIT 5;

```

- Essa consulta retorna os 5 produtos mais vendidos, ordenados pela quantidade total vendida.

---

## 2. **Encontrar o cliente que mais gastou em compras:**

```sql
SELECT Cliente.Nome, SUM(Compra.ValorTotal) AS Total_Gasto
FROM Cliente
JOIN Compra ON Cliente.CPF_Cliente = Compra.CPF_Cliente
GROUP BY Cliente.Nome
ORDER BY Total_Gasto DESC
LIMIT 1;

```

- Aqui, a consulta encontra o cliente que gastou mais em compras, exibindo o nome e o total gasto.

---

## 3. **Calcular o valor total de compras realizadas por clientes que têm alguma reclamação registrada:**

```sql
SELECT Cliente.Nome, SUM(Compra.ValorTotal) AS Total_Compras
FROM Cliente
JOIN Compra ON Cliente.CPF_Cliente = Compra.CPF_Cliente
WHERE Cliente.CPF_Cliente IN (
    SELECT CPF_Cliente FROM Reclamacao
)
GROUP BY Cliente.Nome;

```

- Essa consulta lista os clientes que fizeram reclamações e o valor total que eles gastaram em compras.

---

## 4. **Listar os fornecedores com o maior número de produtos oferecidos e o total de produtos oferecidos por cada um:**

```sql
SELECT Fornecedor.Denominacao_Social, COUNT(Oferece.idProduto) AS Total_Produtos
FROM Fornecedor
JOIN Oferece ON Fornecedor.idFornecedor = Oferece.idFornecedor
GROUP BY Fornecedor.Denominacao_Social
ORDER BY Total_Produtos DESC;

```

- Essa consulta lista os fornecedores e o número total de produtos que eles oferecem, ordenando do maior para o menor.

---

## 5. **Listar todos os clientes que compraram produtos de uma categoria específica (por exemplo, "Eletrônicos"):**

```sql
SELECT DISTINCT Cliente.Nome
FROM Cliente
JOIN Compra ON Cliente.CPF_Cliente = Compra.CPF_Cliente
JOIN Carrinho ON Compra.Cupom_Fiscal = Carrinho.Cupom_Fiscal AND Compra.CPF_Cliente = Carrinho.CPF_Cliente
JOIN Produto ON Carrinho.idProduto = Produto.idProduto
JOIN Categoria_Produto ON Produto.idProduto = Categoria_Produto.idProduto
JOIN Categoria ON Categoria_Produto.idCategoria = Categoria.idCategoria
WHERE Categoria.Descricao = 'Eletrônicos';

```

- Essa consulta encontra os clientes que compraram produtos da categoria "Eletrônicos".

---

## 6. **Exibir a quantidade total de produtos e o valor total de um pedido de compra, incluindo os descontos aplicados:**

```sql
SELECT Pedido_de_Compra.idPedido, SUM(Contem.Quantidade) AS Total_Itens, 
       SUM(Contem.Quantidade * Produto.Preco) AS Valor_Sem_Desconto,
       SUM((Contem.Quantidade * Produto.Preco) - (Contem.Quantidade * Produto.Preco * (Promocao.Valor_Desconto / 100))) AS Valor_Com_Desconto
FROM Pedido_de_Compra
JOIN Contem ON Pedido_de_Compra.idPedido = Contem.idPedido
JOIN Produto ON Contem.idProduto = Produto.idProduto
LEFT JOIN Desconto ON Produto.idProduto = Desconto.idProduto
LEFT JOIN Promocao ON Desconto.idPromocao = Promocao.idPromocao
GROUP BY Pedido_de_Compra.idPedido;

```

- Essa consulta exibe o total de itens, o valor sem desconto e o valor com desconto para cada pedido de compra.

---

## 7. **Encontrar os funcionários com o maior número de reclamações recebidas, ordenando pelo número de reclamações:**

```sql
SELECT Funcionario.Nome, COUNT(Reclamacao.CPF_Cliente) AS Numero_Reclamacoes
FROM Funcionario
JOIN Reclamacao ON Funcionario.CPF_Funcionario = Reclamacao.CPF_Funcionario
GROUP BY Funcionario.Nome
ORDER BY Numero_Reclamacoes DESC;

```

- Essa consulta retorna os funcionários que receberam o maior número de reclamações.

---

## 8. **Calcular o valor total gasto por cliente em cada categoria de produtos:**

```sql
SELECT Cliente.Nome, Categoria.Descricao AS Categoria_Produto, SUM(Carrinho.Quantidade * Produto.Preco) AS Total_Gasto
FROM Cliente
JOIN Compra ON Cliente.CPF_Cliente = Compra.CPF_Cliente
JOIN Carrinho ON Compra.Cupom_Fiscal = Carrinho.Cupom_Fiscal AND Compra.CPF_Cliente = Carrinho.CPF_Cliente
JOIN Produto ON Carrinho.idProduto = Produto.idProduto
JOIN Categoria_Produto ON Produto.idProduto = Categoria_Produto.idProduto
JOIN Categoria ON Categoria_Produto.idCategoria = Categoria.idCategoria
GROUP BY Cliente.Nome, Categoria.Descricao;

```

- Essa consulta calcula o total gasto por cliente em cada categoria de produto que ele comprou.

---

## 9. **Listar os produtos que nunca foram vendidos:**

```sql
SELECT Produto.Descricao
FROM Produto
LEFT JOIN Carrinho ON Produto.idProduto = Carrinho.idProduto
WHERE Carrinho.idProduto IS NULL;

```

- Essa consulta lista todos os produtos que nunca foram vendidos, ou seja, que não aparecem em nenhuma compra.

---

## 10. **Obter a média de avaliação de atendimento por funcionário e filtrar os funcionários com avaliação abaixo de 3:**

```sql
SELECT Funcionario.Nome, AVG(Avalia_Atendimento.nota) AS Media_Avaliacao
FROM Funcionario
JOIN Avalia_Atendimento ON Funcionario.CPF_Funcionario = Avalia_Atendimento.CPF_Funcionario
GROUP BY Funcionario.Nome
HAVING AVG(Avalia_Atendimento.nota) < 3;

```

- Essa consulta exibe os funcionários cuja média de avaliação de atendimento é inferior a 3.

---