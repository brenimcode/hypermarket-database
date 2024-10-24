# Algebra Relacional

### 1. **Listar os 5 produtos mais vendidos de todos os tempos (baseado nas quantidades compradas):**

1. Realize o **join** entre as tabelas `Produto` e `Carrinho`:
    
    ```scss
    σ(Produto.idProduto = Carrinho.idProduto) (Produto × Carrinho)
    ```
    
2. **Agrupe** os resultados por `Produto.Descricao` e **soma** as quantidades:
    
    ```scss
    γ_{Produto.Descricao, SUM(Carrinho.Quantidade)} (σ(Produto.idProduto = Carrinho.idProduto) (Produto × Carrinho))
    ```
    
3. **Ordene** os resultados pela quantidade vendida de forma decrescente e selecione os 5 primeiros:
    
    ```scss
    τ_{desc}(SUM(Carrinho.Quantidade)) (γ_{Produto.Descricao, SUM(Carrinho.Quantidade)} (σ(Produto.idProduto = Carrinho.idProduto) (Produto × Carrinho))) [5]
    ```
    

---

### 2. **Encontrar o cliente que mais gastou em compras:**

1. Realize o **join** entre `Cliente` e `Compra` usando o atributo `CPF_Cliente`:
    
    ```scss
    σ(Cliente.CPF_Cliente = Compra.CPF_Cliente) (Cliente × Compra)
    ```
    
2. **Agrupe** por `Cliente.Nome` e **soma** os valores totais das compras:
    
    ```scss
    γ_{Cliente.Nome, SUM(Compra.ValorTotal)} (σ(Cliente.CPF_Cliente = Compra.CPF_Cliente) (Cliente × Compra))
    ```
    
3. **Ordene** pelo total gasto de forma decrescente e selecione o primeiro:
    
    ```scss
    τ_{desc}(SUM(Compra.ValorTotal)) (γ_{Cliente.Nome, SUM(Compra.ValorTotal)} (σ(Cliente.CPF_Cliente = Compra.CPF_Cliente) (Cliente × Compra))) [1]
    ```
    

---

### 3. **Listar os fornecedores com o maior número de produtos oferecidos:**

1. Realize o **join** entre `Fornecedor` e `Oferece` usando o atributo `idFornecedor`:
    
    ```scss
    σ(Fornecedor.idFornecedor = Oferece.idFornecedor) (Fornecedor × Oferece)
    ```
    
2. **Agrupe** por `Fornecedor.Denominacao_Social` e **conte** o número de produtos oferecidos:
    
    ```scss
    γ_{Fornecedor.Denominacao_Social, COUNT(Oferece.idProduto)} (σ(Fornecedor.idFornecedor = Oferece.idFornecedor) (Fornecedor × Oferece))
    ```
    
3. **Ordene** pelo total de produtos oferecidos de forma decrescente:
    
    ```scss
    τ_{desc}(COUNT(Oferece.idProduto)) (γ_{Fornecedor.Denominacao_Social, COUNT(Oferece.idProduto)} (σ(Fornecedor.idFornecedor = Oferece.idFornecedor) (Fornecedor × Oferece)))
    ```
    

---

### 4. **Calcular o valor total gasto por cliente em cada categoria de produtos:**

1. Realize o **join** entre `Cliente`, `Compra`, `Carrinho`, `Produto`, `Categoria_Produto` e `Categoria`:
    
    ```scss
    σ(Cliente.CPF_Cliente = Compra.CPF_Cliente ∧ Compra.Cupom_Fiscal = Carrinho.Cupom_Fiscal ∧ Carrinho.idProduto = Produto.idProduto ∧ Produto.idProduto = Categoria_Produto.idProduto ∧ Categoria_Produto.idCategoria = Categoria.idCategoria)
    (Cliente × Compra × Carrinho × Produto × Categoria_Produto × Categoria)
    ```
    
2. **Agrupe** por `Cliente.Nome` e `Categoria.Descricao`, somando o valor total gasto:
    
    ```scss
    γ_{Cliente.Nome, Categoria.Descricao, SUM(Carrinho.Quantidade * Produto.Preco)}
    (σ(Cliente.CPF_Cliente = Compra.CPF_Cliente ∧ Compra.Cupom_Fiscal = Carrinho.Cupom_Fiscal ∧ Carrinho.idProduto = Produto.idProduto ∧ Produto.idProduto = Categoria_Produto.idProduto ∧ Categoria_Produto.idCategoria = Categoria.idCategoria)
    (Cliente × Compra × Carrinho × Produto × Categoria_Produto × Categoria))
    ```
    

---