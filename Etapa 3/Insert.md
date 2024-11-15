# Inserções


## Inserções na tabela `Categoria`:

```sql
INSERT INTO Categoria (Descricao, idCategoria) VALUES ('Eletrônicos', 1);
INSERT INTO Categoria (Descricao, idCategoria) VALUES ('Roupas', 2);
INSERT INTO Categoria (Descricao, idCategoria) VALUES ('Alimentos', 3);
INSERT INTO Categoria (Descricao, idCategoria) VALUES ('Livros', 4);
INSERT INTO Categoria (Descricao, idCategoria) VALUES ('Móveis', 5);
INSERT INTO Categoria (Descricao, idCategoria) VALUES ('Ferramentas', 6);
INSERT INTO Categoria (Descricao, idCategoria) VALUES ('Jogos', 7);
INSERT INTO Categoria (Descricao, idCategoria) VALUES ('Brinquedos', 8);
INSERT INTO Categoria (Descricao, idCategoria) VALUES ('Beleza', 9);
INSERT INTO Categoria (Descricao, idCategoria) VALUES ('Automotivo', 10);

```

---

## Inserções na tabela `Fornecedor`:

```sql
INSERT INTO Fornecedor (idFornecedor, Denominacao_Social, Bairro, Cidade, Estado, CEP, Email, CNPJ) VALUES (1, 'Fornecedor A', 'Centro', 'São Paulo', 'SP', '01000-000', 'a@fornecedor.com', '12345678000101');
INSERT INTO Fornecedor (idFornecedor, Denominacao_Social, Bairro, Cidade, Estado, CEP, Email, CNPJ) VALUES (2, 'Fornecedor B', 'Zona Sul', 'Rio de Janeiro', 'RJ', '22000-000', 'b@fornecedor.com', '22345678000101');
INSERT INTO Fornecedor (idFornecedor, Denominacao_Social, Bairro, Cidade, Estado, CEP, Email, CNPJ) VALUES (3, 'Fornecedor C', 'Centro', 'Belo Horizonte', 'MG', '30100-000', 'c@fornecedor.com', '32345678000101');
INSERT INTO Fornecedor (idFornecedor, Denominacao_Social, Bairro, Cidade, Estado, CEP, Email, CNPJ) VALUES (4, 'Fornecedor D', 'Zona Oeste', 'Porto Alegre', 'RS', '91000-000', 'd@fornecedor.com', '42345678000101');
INSERT INTO Fornecedor (idFornecedor, Denominacao_Social, Bairro, Cidade, Estado, CEP, Email, CNPJ) VALUES (5, 'Fornecedor E', 'Centro', 'Curitiba', 'PR', '80000-000', 'e@fornecedor.com', '52345678000101');
INSERT INTO Fornecedor (idFornecedor, Denominacao_Social, Bairro, Cidade, Estado, CEP, Email, CNPJ) VALUES (6, 'Fornecedor F', 'Centro', 'Florianópolis', 'SC', '88000-000', 'f@fornecedor.com', '62345678000101');
INSERT INTO Fornecedor (idFornecedor, Denominacao_Social, Bairro, Cidade, Estado, CEP, Email, CNPJ) VALUES (7, 'Fornecedor G', 'Centro', 'Salvador', 'BA', '40000-000', 'g@fornecedor.com', '72345678000101');
INSERT INTO Fornecedor (idFornecedor, Denominacao_Social, Bairro, Cidade, Estado, CEP, Email, CNPJ) VALUES (8, 'Fornecedor H', 'Centro', 'Recife', 'PE', '50000-000', 'h@fornecedor.com', '82345678000101');
INSERT INTO Fornecedor (idFornecedor, Denominacao_Social, Bairro, Cidade, Estado, CEP, Email, CNPJ) VALUES (9, 'Fornecedor I', 'Centro', 'Manaus', 'AM', '69000-000', 'i@fornecedor.com', '92345678000101');
INSERT INTO Fornecedor (idFornecedor, Denominacao_Social, Bairro, Cidade, Estado, CEP, Email, CNPJ) VALUES (10, 'Fornecedor J', 'Centro', 'Fortaleza', 'CE', '60000-000', 'j@fornecedor.com', '02345678000101');

```

---

## Inserções na tabela `Promocao`:

```sql
INSERT INTO Promocao (idPromocao, Data_de_Inicio, Data_do_Fim, Nome, Descricao, Valor_Desconto) VALUES (1, '2024-01-01', '2024-01-10', 'Promoção Ano Novo', 'Desconto de 10% em todos os produtos', 10.00);
INSERT INTO Promocao (idPromocao, Data_de_Inicio, Data_do_Fim, Nome, Descricao, Valor_Desconto) VALUES (2, '2024-02-01', '2024-02-15', 'Promoção Carnaval', 'Desconto de 15% em roupas', 15.00);
INSERT INTO Promocao (idPromocao, Data_de_Inicio, Data_do_Fim, Nome, Descricao, Valor_Desconto) VALUES (3, '2024-03-01', '2024-03-10', 'Promoção Dia das Mulheres', 'Desconto de 20% em cosméticos', 20.00);
INSERT INTO Promocao (idPromocao, Data_de_Inicio, Data_do_Fim, Nome, Descricao, Valor_Desconto) VALUES (4, '2024-04-01', '2024-04-15', 'Promoção Páscoa', 'Desconto de 25% em chocolates', 25.00);
INSERT INTO Promocao (idPromocao, Data_de_Inicio, Data_do_Fim, Nome, Descricao, Valor_Desconto) VALUES (5, '2024-05-01', '2024-05-10', 'Promoção Dia das Mães', 'Desconto de 15% em todos os produtos', 15.00);
INSERT INTO Promocao (idPromocao, Data_de_Inicio, Data_do_Fim, Nome, Descricao, Valor_Desconto) VALUES (6, '2024-06-01', '2024-06-10', 'Promoção Namorados', 'Desconto de 30% em perfumes', 30.00);
INSERT INTO Promocao (idPromocao, Data_de_Inicio, Data_do_Fim, Nome, Descricao, Valor_Desconto) VALUES (7, '2024-07-01', '2024-07-15', 'Promoção Férias', 'Desconto de 20% em viagens', 20.00);
INSERT INTO Promocao (idPromocao, Data_de_Inicio, Data_do_Fim, Nome, Descricao, Valor_Desconto) VALUES (8, '2024-08-01', '2024-08-10', 'Promoção Dia dos Pais', 'Desconto de 15% em eletrônicos', 15.00);
INSERT INTO Promocao (idPromocao, Data_de_Inicio, Data_do_Fim, Nome, Descricao, Valor_Desconto) VALUES (9, '2024-09-01', '2024-09-10', 'Promoção Primavera', 'Desconto de 10% em roupas e acessórios', 10.00);
INSERT INTO Promocao (idPromocao, Data_de_Inicio, Data_do_Fim, Nome, Descricao, Valor_Desconto) VALUES (10, '2024-10-01', '2024-10-15', 'Promoção Dia das Crianças', 'Desconto de 25% em brinquedos', 25.00);

```

---

## Inserções na tabela `ESPECIAL`:

```sql
INSERT INTO ESPECIAL (Valor_Minimo_Gasto_Anual, Descricao, idCategoria) VALUES (1000.00, 'Diamante', 1);
INSERT INTO ESPECIAL (Valor_Minimo_Gasto_Anual, Descricao, idCategoria) VALUES (800.00, 'Ouro', 2);
INSERT INTO ESPECIAL (Valor_Minimo_Gasto_Anual, Descricao, idCategoria) VALUES (500.00, 'Prata', 3);
INSERT INTO ESPECIAL (Valor_Minimo_Gasto_Anual, Descricao, idCategoria) VALUES (0.00, 'Comum', 4);
```

---

## Inserções na tabela `Promocao_Especial`:

```sql
-- Diamante tem todas as promoções
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (15.00, 1, 1); -- Promoção 1
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (10.00, 2, 1); -- Promoção 2
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (20.00, 3, 1); -- Promoção 3
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (25.00, 4, 1); -- Promoção 4
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (15.00, 5, 1); -- Promoção 5
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (30.00, 6, 1); -- Promoção 6
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (20.00, 7, 1); -- Promoção 7
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (15.00, 8, 1); -- Promoção 8
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (10.00, 9, 1); -- Promoção 9
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (25.00, 10, 1); -- Promoção 10

-- Ouro tem acesso a algumas promoções
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (10.00, 2, 2); -- Promoção 2
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (15.00, 5, 2); -- Promoção 5
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (15.00, 8, 2); -- Promoção 8

-- Prata tem acesso a menos promoções
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (20.00, 3, 3); -- Promoção 3
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (20.00, 7, 3); -- Promoção 7
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (10.00, 9, 3); -- Promoção 9
```

---

## Inserções na tabela `Compra_Desconto`:

```sql
INSERT INTO Compra_Desconto (idPromocao) VALUES (1);
INSERT INTO Compra_Desconto (idPromocao) VALUES (2);
INSERT INTO Compra_Desconto (idPromocao) VALUES (3);
INSERT INTO Compra_Desconto (idPromocao) VALUES (4);
INSERT INTO Compra_Desconto (idPromocao) VALUES (5);
INSERT INTO Compra_Desconto (idPromocao) VALUES (6);
INSERT INTO Compra_Desconto (idPromocao) VALUES (7);
INSERT INTO Compra_Desconto (idPromocao) VALUES (8);
INSERT INTO Compra_Desconto (idPromocao) VALUES (9);
INSERT INTO Compra_Desconto (idPromocao) VALUES (10);

```

---

## Inserções na tabela `Fornecedor_Telefone`:

```sql
INSERT INTO Fornecedor_Telefone (Telefone, idFornecedor) VALUES ('11123456789', 1);
INSERT INTO Fornecedor_Telefone (Telefone, idFornecedor) VALUES ('11234567890', 2);
INSERT INTO Fornecedor_Telefone (Telefone, idFornecedor) VALUES ('11345678901', 3);
INSERT INTO Fornecedor_Telefone (Telefone, idFornecedor) VALUES ('11456789012', 4);
INSERT INTO Fornecedor_Telefone (Telefone, idFornecedor) VALUES ('11567890123', 5);
INSERT INTO Fornecedor_Telefone (Telefone, idFornecedor) VALUES ('11678901234', 6);
INSERT INTO Fornecedor_Telefone (Telefone, idFornecedor) VALUES ('11789012345', 7);
INSERT INTO Fornecedor_Telefone (Telefone, idFornecedor) VALUES ('11890123456', 8);
INSERT INTO Fornecedor_Telefone (Telefone, idFornecedor) VALUES ('11901234567', 9);
INSERT INTO Fornecedor_Telefone (Telefone, idFornecedor) VALUES ('11123456780', 10);

```

---

## Inserções na tabela `Cliente`:

```sql
INSERT INTO Cliente (CPF_Cliente, Nome, Residencial, Entrega, Telefone, Data_nascimento, Profissao, idCategoria) 
VALUES ('12345678900', 'Carlos Silva', 'Rua A, 123', 'Rua B, 456', '11987654321', '1985-05-15', 'Engenheiro', 1);

INSERT INTO Cliente (CPF_Cliente, Nome, Residencial, Entrega, Telefone, Data_nascimento, Profissao, idCategoria) 
VALUES ('22345678900', 'Ana Souza', 'Rua C, 789', 'Rua D, 321', '11976543210', '1990-07-20', 'Médica', 2);

INSERT INTO Cliente (CPF_Cliente, Nome, Residencial, Entrega, Telefone, Data_nascimento, Profissao, idCategoria) 
VALUES ('32345678900', 'Bruno Lima', 'Rua E, 654', 'Rua F, 987', '11965432109', '1982-03-25', 'Advogado', 3);

INSERT INTO Cliente (CPF_Cliente, Nome, Residencial, Entrega, Telefone, Data_nascimento, Profissao, idCategoria) 
VALUES ('42345678900', 'Fernanda Gomes', 'Rua G, 741', 'Rua H, 852', '11954321098', '1995-12-30', 'Designer', 4);

INSERT INTO Cliente (CPF_Cliente, Nome, Residencial, Entrega, Telefone, Data_nascimento, Profissao, idCategoria) 
VALUES ('52345678900', 'Mariana Oliveira', 'Rua I, 963', 'Rua J, 753', '11943210987', '1987-08-15', 'Professora', 1);

INSERT INTO Cliente (CPF_Cliente, Nome, Residencial, Entrega, Telefone, Data_nascimento, Profissao, idCategoria) 
VALUES ('62345678900', 'Rafael Souza', 'Rua K, 159', 'Rua L, 357', '11932109876', '1989-11-10', 'Analista', 1);

INSERT INTO Cliente (CPF_Cliente, Nome, Residencial, Entrega, Telefone, Data_nascimento, Profissao, idCategoria) 
VALUES ('72345678900', 'Juliana Rodrigues', 'Rua M, 258', 'Rua N, 654', '11921098765', '1992-02-18', 'Arquiteta', 1);

INSERT INTO Cliente (CPF_Cliente, Nome, Residencial, Entrega, Telefone, Data_nascimento, Profissao, idCategoria) 
VALUES ('82345678900', 'Guilherme Santos', 'Rua O, 951', 'Rua P, 852', '11910987654', '1986-06-27', 'Empresário', 1);

INSERT INTO Cliente (CPF_Cliente, Nome, Residencial, Entrega, Telefone, Data_nascimento, Profissao, idCategoria) 
VALUES ('92345678900', 'Patrícia Almeida', 'Rua Q, 369', 'Rua R, 147', '11909876543', '1993-09-05', 'Dentista', 1);

INSERT INTO Cliente (CPF_Cliente, Nome, Residencial, Entrega, Telefone, Data_nascimento, Profissao, idCategoria) 
VALUES ('02345678900', 'Marcelo Batista', 'Rua S, 753', 'Rua T, 951', '11998765432', '1983-04-01', 'Consultor', 1);
```

---

## Inserções na tabela `Produto`:

```sql
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque) 
VALUES ('Smartphone', 1, 'Unidade', 'foto1.jpg', 2000.00, 'Samsung', 4.5, 1, 50);
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque) 
VALUES ('Camisa', 2, 'Unidade', 'foto2.jpg', 80.00, 'Nike', 4.0, 2, 150);
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque) 
VALUES ('Chocolate', 3, 'Unidade', 'foto3.jpg', 10.00, 'Nestle', 4.7, 3, 200);
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque) 
VALUES ('Livro', 4, 'Unidade', 'foto4.jpg', 40.00, 'Editora ABC', 4.3, 4, 100);
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque) 
VALUES ('Mesa', 5, 'Unidade', 'foto5.jpg', 300.00, 'Tok&Stok', 4.2, 5, 20);
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque) 
VALUES ('Martelo', 6, 'Unidade', 'foto6.jpg', 25.00, 'Tramontina', 4.6, 6, 75);
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque) 
VALUES ('Jogo de tabuleiro', 7, 'Unidade', 'foto7.jpg', 120.00, 'Hasbro', 4.8, 7, 30);
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque) 
VALUES ('Boneca', 8, 'Unidade', 'foto8.jpg', 50.00, 'Mattel', 4.5, 8, 100);
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque) 
VALUES ('Shampoo', 9, 'Unidade', 'foto9.jpg', 15.00, 'Loreal', 4.7, 9, 250);
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque) 
VALUES ('Pneu', 10, 'Unidade', 'foto10.jpg', 500.00, 'Michelin', 4.9, 10, 60);
INSERT INTO Produto (Descricao, idProduto, Unidade_de_Venda, Foto, Preco, Nome_do_Fabricante, Media, idSessao, Estoque)
VALUES ('Notebook', 11, 'Unidade', 'foto11.jpg', 3500.00, 'Dell', 4.8, 1, 100);

```

---

## Inserções na tabela `Sessao`:

```sql
INSERT INTO Sessao (Nome, idSessao, CPF_Funcionario) VALUES ('Eletrônicos', 1, '12345678901');
INSERT INTO Sessao (Nome, idSessao, CPF_Funcionario) VALUES ('Roupas', 2, '22345678901');
INSERT INTO Sessao (Nome, idSessao, CPF_Funcionario) VALUES ('Alimentos', 3, '32345678901');
INSERT INTO Sessao (Nome, idSessao, CPF_Funcionario) VALUES ('Livros', 4, '42345678901');
INSERT INTO Sessao (Nome, idSessao, CPF_Funcionario) VALUES ('Móveis', 5, '52345678901');
INSERT INTO Sessao (Nome, idSessao, CPF_Funcionario) VALUES ('Ferramentas', 6, '62345678901');
INSERT INTO Sessao (Nome, idSessao, CPF_Funcionario) VALUES ('Jogos', 7, '72345678901');
INSERT INTO Sessao (Nome, idSessao, CPF_Funcionario) VALUES ('Brinquedos', 8, '82345678901');
INSERT INTO Sessao (Nome, idSessao, CPF_Funcionario) VALUES ('Beleza', 9, '92345678901');
INSERT INTO Sessao (Nome, idSessao, CPF_Funcionario) VALUES ('Automotivo', 10, '02345678901');

```

---

## Inserções na tabela `Pedido_de_Compra`:

```sql
INSERT INTO Pedido_de_Compra (idPedido, Data_de_Emissao, Data_de_Entrega, Data_da_Previsao_de_Entrega, Condicao_de_Pagamento, Devolucao, Valor_Total, Valor_Total_com_Desconto, idFornecedor, CPF_Funcionario) 
VALUES (1, '2024-01-10', '2024-01-15', '2024-01-12', 'À vista', FALSE, 5000.00, 4500.00, 1, '12345678901');
INSERT INTO Pedido_de_Compra (idPedido, Data_de_Emissao, Data_de_Entrega, Data_da_Previsao_de_Entrega, Condicao_de_Pagamento, Devolucao, Valor_Total, Valor_Total_com_Desconto, idFornecedor, CPF_Funcionario) 
VALUES (2, '2024-02-10', '2024-02-20', '2024-02-15', 'Parcelado', FALSE, 6000.00, 5400.00, 2, '22345678901');
INSERT INTO Pedido_de_Compra (idPedido, Data_de_Emissao, Data_de_Entrega, Data_da_Previsao_de_Entrega, Condicao_de_Pagamento, Devolucao, Valor_Total, Valor_Total_com_Desconto, idFornecedor, CPF_Funcionario) 
VALUES (3, '2024-03-10', '2024-03-25', '2024-03-20', 'À vista', TRUE, 7000.00, 6300.00, 3, '32345678901');
INSERT INTO Pedido_de_Compra (idPedido, Data_de_Emissao, Data_de_Entrega, Data_da_Previsao_de_Entrega, Condicao_de_Pagamento, Devolucao, Valor_Total, Valor_Total_com_Desconto, idFornecedor, CPF_Funcionario) 
VALUES (4, '2024-04-05', '2024-04-15', '2024-04-10', 'Parcelado', FALSE, 8000.00, 7200.00, 4, '42345678901');
INSERT INTO Pedido_de_Compra (idPedido, Data_de_Emissao, Data_de_Entrega, Data_da_Previsao_de_Entrega, Condicao_de_Pagamento, Devolucao, Valor_Total, Valor_Total_com_Desconto, idFornecedor, CPF_Funcionario) 
VALUES (5, '2024-05-05', '2024-05-20', '2024-05-15', 'À vista', TRUE, 9000.00, 8100.00, 5, '52345678901');
INSERT INTO Pedido_de_Compra (idPedido, Data_de_Emissao, Data_de_Entrega, Data_da_Previsao_de_Entrega, Condicao_de_Pagamento, Devolucao, Valor_Total, Valor_Total_com_Desconto, idFornecedor, CPF_Funcionario) 
VALUES (6, '2024-06-10', '2024-06-25', '2024-06-20', 'Parcelado', FALSE, 10000.00, 9000.00, 6, '62345678901');
INSERT INTO Pedido_de_Compra (idPedido, Data_de_Emissao, Data_de_Entrega, Data_da_Previsao_de_Entrega, Condicao_de_Pagamento, Devolucao, Valor_Total, Valor_Total_com_Desconto, idFornecedor, CPF_Funcionario) 
VALUES (7, '2024-07-15', '2024-07-30', '2024-07-25', 'À vista', TRUE, 11000.00, 9900.00, 7, '72345678901');
INSERT INTO Pedido_de_Compra (idPedido, Data_de_Emissao, Data_de_Entrega, Data_da_Previsao_de_Entrega, Condicao_de_Pagamento, Devolucao, Valor_Total, Valor_Total_com_Desconto, idFornecedor, CPF_Funcionario) 
VALUES (8, '2024-08-20', '2024-09-01', '2024-08-30', 'Parcelado', FALSE, 12000.00, 10800.00, 8, '82345678901');
INSERT INTO Pedido_de_Compra (idPedido, Data_de_Emissao, Data_de_Entrega, Data_da_Previsao_de_Entrega, Condicao_de_Pagamento, Devolucao, Valor_Total, Valor_Total_com_Desconto, idFornecedor, CPF_Funcionario) 
VALUES (9, '2024-09-10', '2024-09-20', '2024-09-15', 'À vista', FALSE, 13000.00, 11700.00, 9, '92345678901');
INSERT INTO Pedido_de_Compra (idPedido, Data_de_Emissao, Data_de_Entrega, Data_da_Previsao_de_Entrega, Condicao_de_Pagamento, Devolucao, Valor_Total, Valor_Total_com_Desconto, idFornecedor, CPF_Funcionario) 
VALUES (10, '2024-10-05', '2024-10-15', '2024-10-10', 'Parcelado', TRUE, 14000.00, 12600.00, 10, '02345678901');

```

---

## Inserções na tabela `Contrato`:

```sql
INSERT INTO Contrato (Prazo_Medio_de_Entrega, Condicoes_de_Pagamento, Desconto, Valor_Total_do_Ano_Anterior, idFornecedor, CPF_Funcionario) 
VALUES ('10 dias', 'À vista', 5.00, 50000.00, 1, '12345678901');
INSERT INTO Contrato (Prazo_Medio_de_Entrega, Condicoes_de_Pagamento, Desconto, Valor_Total_do_Ano_Anterior, idFornecedor, CPF_Funcionario) 
VALUES ('15 dias', 'Parcelado', 10.00, 60000.00, 2, '22345678901');
INSERT INTO Contrato (Prazo_Medio_de_Entrega, Condicoes_de_Pagamento, Desconto, Valor_Total_do_Ano_Anterior, idFornecedor, CPF_Funcionario) 
VALUES ('12 dias', 'À vista', 8.00, 70000.00, 3, '32345678901');
INSERT INTO Contrato (Prazo_Medio_de_Entrega, Condicoes_de_Pagamento, Desconto, Valor_Total_do_Ano_Anterior, idFornecedor, CPF_Funcionario) 
VALUES ('20 dias', 'Parcelado', 7.00, 80000.00, 4, '42345678901');
INSERT INTO Contrato (Prazo_Medio_de_Entrega, Condicoes_de_Pagamento, Desconto, Valor_Total_do_Ano_Anterior, idFornecedor, CPF_Funcionario) 
VALUES ('14 dias', 'À vista', 9.00, 90000.00, 5, '52345678901');
INSERT INTO Contrato (Prazo_Medio_de_Entrega, Condicoes_de_Pagamento, Desconto, Valor_Total_do_Ano_Anterior, idFornecedor, CPF_Funcionario) 
VALUES ('18 dias', 'Parcelado', 6.00, 100000.00, 6, '62345678901');
INSERT INTO Contrato (Prazo_Medio_de_Entrega, Condicoes_de_Pagamento, Desconto, Valor_Total_do_Ano_Anterior, idFornecedor, CPF_Funcionario) 
VALUES ('10 dias', 'À vista', 5.00, 110000.00, 7, '72345678901');
INSERT INTO Contrato (Prazo_Medio_de_Entrega, Condicoes_de_Pagamento, Desconto, Valor_Total_do_Ano_Anterior, idFornecedor, CPF_Funcionario) 
VALUES ('20 dias', 'Parcelado', 12.00, 120000.00, 8, '82345678901');
INSERT INTO Contrato (Prazo_Medio_de_Entrega, Condicoes_de_Pagamento, Desconto, Valor_Total_do_Ano_Anterior, idFornecedor, CPF_Funcionario) 
VALUES ('15 dias', 'À vista', 10.00, 130000.00, 9, '92345678901');
INSERT INTO Contrato (Prazo_Medio_de_Entrega, Condicoes_de_Pagamento, Desconto, Valor_Total_do_Ano_Anterior, idFornecedor, CPF_Funcionario) 
VALUES ('25 dias', 'Parcelado', 15.00, 140000.00, 10, '02345678901');

```

---

## Inserções na tabela `Funcionario`:

```sql
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('12345678901', 40, 3000.00, 50.00, 'Vendedor', 'João Almeida', 'Rua A, 123', '11987654321', '1990-01-01', 'Ensino Médio', 'Solteiro');
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('22345678901', 40, 3500.00, 60.00, 'Gerente', 'Maria Souza', 'Rua B, 456', '11976543210', '1985-02-02', 'Ensino Superior', 'Casada');
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('32345678901', 40, 2500.00, 45.00, 'Atendente', 'Carlos Lima', 'Rua C, 789', '11965432109', '1992-03-03', 'Ensino Médio', 'Solteiro');
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('42345678901', 40, 4000.00, 70.00, 'Gerente', 'Ana Costa', 'Rua D, 321', '11954321098', '1980-04-04', 'Ensino Superior', 'Casada');
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('52345678901', 40, 2800.00, 55.00, 'Caixa', 'Pedro Oliveira', 'Rua E, 654', '11943210987', '1991-05-05', 'Ensino Médio', 'Solteiro');
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('62345678901', 40, 3200.00, 60.00, 'Repositor', 'Fernanda Silva', 'Rua F, 987', '11932109876', '1993-06-06', 'Ensino Médio', 'Casada');
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('72345678901', 40, 2700.00, 50.00, 'Vendedor', 'Rafael Lima', 'Rua G, 741', '11921098765', '1988-07-07', 'Ensino Médio', 'Casado');
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('82345678901', 40, 3600.00, 65.00, 'Gerente', 'Juliana Silva', 'Rua H, 852', '11910987654', '1987-08-08', 'Ensino Superior', 'Casada');
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('92345678901', 40, 2400.00, 40.00, 'Atendente', 'Bruno Costa', 'Rua I, 963', '11909876543', '1994-09-09', 'Ensino Médio', 'Solteiro');
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('02345678901', 40, 3800.00, 70.00, 'Gerente', 'Mariana Souza', 'Rua J, 753', '11998765432', '1986-10-10', 'Ensino Superior', 'Casada');

```

---

## Inserções na tabela `Gerente`:

```sql
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario) 
VALUES ('2015-01-15', 'MBA em Gestão de Pessoas', '22345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario) 
VALUES ('2017-02-20', 'Especialização em Administração', '42345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario) 
VALUES ('2018-03-10', 'MBA em Gestão Empresarial', '52345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario) 
VALUES ('2019-04-25', 'MBA em Finanças', '82345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario) 
VALUES ('2016-05-18', 'MBA em Gestão de Negócios', '02345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario) 
VALUES ('2020-06-22', 'Especialização em Vendas', '72345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario) 
VALUES ('2014-07-30', 'MBA em Liderança', '32345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario) 
VALUES ('2016-08-17', 'Pós-graduação em Gestão de Projetos', '62345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario) 
VALUES ('2021-09-12', 'Especialização em Operações', '72345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario) 
VALUES ('2018-10-05', 'MBA em Logística', '92345678901');

```

---

## Inserções na tabela `Atendente_caixa`:

```sql
INSERT INTO Atendente_caixa (CPF_Funcionario) 
VALUES ('52345678901');
INSERT INTO Atendente_caixa (CPF_Funcionario) 
VALUES ('32345678901');
INSERT INTO Atendente_caixa (CPF_Funcionario) 
VALUES ('92345678901');
INSERT INTO Atendente_caixa (CPF_Funcionario) 
VALUES ('72345678901');
INSERT INTO Atendente_caixa (CPF_Funcionario) 
VALUES ('42345678901');
INSERT INTO Atendente_caixa (CPF_Funcionario) 
VALUES ('12345678901');
INSERT INTO Atendente_caixa (CPF_Funcionario) 
VALUES ('22345678901');
INSERT INTO Atendente_caixa (CPF_Funcionario) 
VALUES ('82345678901');
INSERT INTO Atendente_caixa (CPF_Funcionario) 
VALUES ('62345678901');
INSERT INTO Atendente_caixa (CPF_Funcionario) 
VALUES ('02345678901');

```

---

## Inserções na tabela `Compra`:

```sql
INSERT INTO Compra (Data, Horario, ValorTotal, Valor_com_desconto, Forma_pagamento, Cupom_Fiscal, CPF_Cliente, CPF_Funcionario) 
VALUES ('2024-01-10', '10:30:00', 500.00, 450.00, 'Cartão de Crédito', 1, '12345678900', '52345678901');
INSERT INTO Compra (Data, Horario, ValorTotal, Valor_com_desconto, Forma_pagamento, Cupom_Fiscal, CPF_Cliente, CPF_Funcionario) 
VALUES ('2024-02-12', '11:45:00', 700.00, 650.00, 'Dinheiro', 2, '22345678900', '32345678901');
INSERT INTO Compra (Data, Horario, ValorTotal, Valor_com_desconto, Forma_pagamento, Cupom_Fiscal, CPF_Cliente, CPF_Funcionario) 
VALUES ('2024-03-15', '12:15:00', 900.00, 850.00, 'Cartão de Débito', 3, '32345678900', '92345678901');
INSERT INTO Compra (Data, Horario, ValorTotal, Valor_com_desconto, Forma_pagamento, Cupom_Fiscal, CPF_Cliente, CPF_Funcionario) 
VALUES ('2024-04-18', '14:00:00', 1200.00, 1100.00, 'Cartão de Crédito', 4, '42345678900', '72345678901');
INSERT INTO Compra (Data, Horario, ValorTotal, Valor_com_desconto, Forma_pagamento, Cupom_Fiscal, CPF_Cliente, CPF_Funcionario) 
VALUES ('2024-05-20', '15:30:00', 1500.00, 1400.00, 'Dinheiro', 5, '52345678900', '42345678901');
INSERT INTO Compra (Data, Horario, ValorTotal, Valor_com_desconto, Forma_pagamento, Cupom_Fiscal, CPF_Cliente, CPF_Funcionario) 
VALUES ('2024-06-25', '16:45:00', 1800.00, 1700.00, 'Pix', 6, '62345678900', '12345678901');
INSERT INTO Compra (Data, Horario, ValorTotal, Valor_com_desconto, Forma_pagamento, Cupom_Fiscal, CPF_Cliente, CPF_Funcionario) 
VALUES ('2024-07-30', '17:30:00', 2000.00, 1900.00, 'Cartão de Crédito', 7, '72345678900', '22345678901');
INSERT INTO Compra (Data, Horario, ValorTotal, Valor_com_desconto, Forma_pagamento, Cupom_Fiscal, CPF_Cliente, CPF_Funcionario) 
VALUES ('2024-08-10', '18:00:00', 2200.00, 2100.00, 'Dinheiro', 8, '82345678900', '82345678901');
INSERT INTO Compra (Data, Horario, ValorTotal, Valor_com_desconto, Forma_pagamento, Cupom_Fiscal, CPF_Cliente, CPF_Funcionario) 
VALUES ('2024-09-15', '19:15:00', 2400.00, 2300.00, 'Cartão de Débito', 9, '92345678900', '62345678901');
INSERT INTO Compra (Data, Horario, ValorTotal, Valor_com_desconto, Forma_pagamento, Cupom_Fiscal, CPF_Cliente, CPF_Funcionario) 
VALUES ('2024-10-20', '20:30:00', 2600.00, 2500.00, 'Cartão de Crédito', 10, '02345678900', '02345678901');

```

---

## Inserções na tabela `Repositor_gondola`:

```sql
INSERT INTO Repositor_gondola (CPF_Funcionario) 
VALUES ('12345678901');
INSERT INTO Repositor_gondola (CPF_Funcionario) 
VALUES ('22345678901');
INSERT INTO Repositor_gondola (CPF_Funcionario) 
VALUES ('32345678901');
INSERT INTO Repositor_gondola (CPF_Funcionario) 
VALUES ('42345678901');
INSERT INTO Repositor_gondola (CPF_Funcionario) 
VALUES ('52345678901');
INSERT INTO Repositor_gondola (CPF_Funcionario) 
VALUES ('62345678901');
INSERT INTO Repositor_gondola (CPF_Funcionario) 
VALUES ('72345678901');
INSERT INTO Repositor_gondola (CPF_Funcionario) 
VALUES ('82345678901');
INSERT INTO Repositor_gondola (CPF_Funcionario) 
VALUES ('92345678901');
INSERT INTO Repositor_gondola (CPF_Funcionario) 
VALUES ('02345678901');

```

---

## Inserções na tabela `Categoria_Produto`:

```sql
INSERT INTO Categoria_Produto (idProduto, idCategoria) 
VALUES (1, 1);
INSERT INTO Categoria_Produto (idProduto, idCategoria) 
VALUES (2, 2);
INSERT INTO Categoria_Produto (idProduto, idCategoria) 
VALUES (3, 3);
INSERT INTO Categoria_Produto (idProduto, idCategoria) 
VALUES (4, 4);
INSERT INTO Categoria_Produto (idProduto, idCategoria) 
VALUES (5, 5);
INSERT INTO Categoria_Produto (idProduto, idCategoria) 
VALUES (6, 6);
INSERT INTO Categoria_Produto (idProduto, idCategoria) 
VALUES (7, 7);
INSERT INTO Categoria_Produto (idProduto, idCategoria) 
VALUES (8, 8);
INSERT INTO Categoria_Produto (idProduto, idCategoria) 
VALUES (9, 9);
INSERT INTO Categoria_Produto (idProduto, idCategoria) 
VALUES (10, 10);

```

---

## Inserções na tabela `Oferece`:

```sql
INSERT INTO Oferece (Preco_Custo, idFornecedor, idProduto) 
VALUES (1800.00, 1, 1);
INSERT INTO Oferece (Preco_Custo, idFornecedor, idProduto) 
VALUES (70.00, 2, 2);
INSERT INTO Oferece (Preco_Custo, idFornecedor, idProduto) 
VALUES (8.00, 3, 3);
INSERT INTO Oferece (Preco_Custo, idFornecedor, idProduto) 
VALUES (30.00, 4, 4);
INSERT INTO Oferece (Preco_Custo, idFornecedor, idProduto) 
VALUES (250.00, 5, 5);
INSERT INTO Oferece (Preco_Custo, idFornecedor, idProduto) 
VALUES (20.00, 6, 6);
INSERT INTO Oferece (Preco_Custo, idFornecedor, idProduto) 
VALUES (100.00, 7, 7);
INSERT INTO Oferece (Preco_Custo, idFornecedor, idProduto) 
VALUES (40.00, 8, 8);
INSERT INTO Oferece (Preco_Custo, idFornecedor, idProduto) 
VALUES (12.00, 9, 9);
INSERT INTO Oferece (Preco_Custo, idFornecedor, idProduto) 
VALUES (450.00, 10, 10);

```

---

## Inserções na tabela `Contem`:

```sql
INSERT INTO Contem (Quantidade, idPedido, idProduto) 
VALUES (5, 1, 1);
INSERT INTO Contem (Quantidade, idPedido, idProduto) 
VALUES (10, 2, 2);
INSERT INTO Contem (Quantidade, idPedido, idProduto) 
VALUES (20, 3, 3);
INSERT INTO Contem (Quantidade, idPedido, idProduto) 
VALUES (15, 4, 4);
INSERT INTO Contem (Quantidade, idPedido, idProduto) 
VALUES (7, 5, 5);
INSERT INTO Contem (Quantidade, idPedido, idProduto) 
VALUES (12, 6, 6);
INSERT INTO Contem (Quantidade, idPedido, idProduto) 
VALUES (8, 7, 7);
INSERT INTO Contem (Quantidade, idPedido, idProduto) 
VALUES (6, 8, 8);
INSERT INTO Contem (Quantidade, idPedido, idProduto) 
VALUES (18, 9, 9);
INSERT INTO Contem (Quantidade, idPedido, idProduto) 
VALUES (3, 10, 10);

```

---

## Inserções na tabela `Desconto`:

```sql
INSERT INTO Desconto (idProduto, idPromocao) 
VALUES (1, 1);
INSERT INTO Desconto (idProduto, idPromocao) 
VALUES (2, 2);
INSERT INTO Desconto (idProduto, idPromocao) 
VALUES (3, 3);
INSERT INTO Desconto (idProduto, idPromocao) 
VALUES (4, 4);
INSERT INTO Desconto (idProduto, idPromocao) 
VALUES (5, 5);
INSERT INTO Desconto (idProduto, idPromocao) 
VALUES (6, 6);
INSERT INTO Desconto (idProduto, idPromocao) 
VALUES (7, 7);
INSERT INTO Desconto (idProduto, idPromocao) 
VALUES (8, 8);
INSERT INTO Desconto (idProduto, idPromocao) 
VALUES (9, 9);
INSERT INTO Desconto (idProduto, idPromocao) 
VALUES (10, 10);

```

---

## Inserções na tabela `Carrinho`:

```sql
INSERT INTO Carrinho (Quantidade, idProduto, Cupom_Fiscal, CPF_Cliente) 
VALUES (2, 1, 1, '12345678900');
INSERT INTO Carrinho (Quantidade, idProduto, Cupom_Fiscal, CPF_Cliente) 
VALUES (1, 2, 2, '22345678900');
INSERT INTO Carrinho (Quantidade, idProduto, Cupom_Fiscal, CPF_Cliente) 
VALUES (5, 3, 3, '32345678900');
INSERT INTO Carrinho (Quantidade, idProduto, Cupom_Fiscal, CPF_Cliente) 
VALUES (3, 4, 4, '42345678900');
INSERT INTO Carrinho (Quantidade, idProduto, Cupom_Fiscal, CPF_Cliente) 
VALUES (7, 5, 5, '52345678900');
INSERT INTO Carrinho (Quantidade, idProduto, Cupom_Fiscal, CPF_Cliente) 
VALUES (2, 6, 6, '62345678900');
INSERT INTO Carrinho (Quantidade, idProduto, Cupom_Fiscal, CPF_Cliente) 
VALUES (4, 7, 7, '72345678900');
INSERT INTO Carrinho (Quantidade, idProduto, Cupom_Fiscal, CPF_Cliente) 
VALUES (8, 8, 8, '82345678900');
INSERT INTO Carrinho (Quantidade, idProduto, Cupom_Fiscal, CPF_Cliente) 
VALUES (3, 9, 9, '92345678900');
INSERT INTO Carrinho (Quantidade, idProduto, Cupom_Fiscal, CPF_Cliente) 
VALUES (1, 10, 10, '02345678900');

```

---

## Inserções na tabela `Reclamacao`:

```sql
INSERT INTO Reclamacao (Descricao, CPF_Funcionario, CPF_Cliente) 
VALUES ('Demora no atendimento', '22345678901', '12345678900');
INSERT INTO Reclamacao (Descricao, CPF_Funcionario, CPF_Cliente) 
VALUES ('Produto com defeito', '32345678901', '22345678900');
INSERT INTO Reclamacao (Descricao, CPF_Funcionario, CPF_Cliente) 
VALUES ('Cobrança indevida', '42345678901', '32345678900');
INSERT INTO Reclamacao (Descricao, CPF_Funcionario, CPF_Cliente) 
VALUES ('Entrega atrasada', '52345678901', '42345678900');
INSERT INTO Reclamacao (Descricao, CPF_Funcionario, CPF_Cliente) 
VALUES ('Atendimento ruim', '62345678901', '52345678900');
INSERT INTO Reclamacao (Descricao, CPF_Funcionario, CPF_Cliente) 
VALUES ('Falta de produtos', '72345678901', '62345678900');
INSERT INTO Reclamacao (Descricao, CPF_Funcionario, CPF_Cliente) 
VALUES ('Má qualidade do produto', '82345678901', '72345678900');
INSERT INTO Reclamacao (Descricao, CPF_Funcionario, CPF_Cliente) 
VALUES ('Demora na resposta', '92345678901', '82345678900');
INSERT INTO Reclamacao (Descricao, CPF_Funcionario, CPF_Cliente) 
VALUES ('Produto diferente do solicitado', '02345678901', '92345678900');
INSERT INTO Reclamacao (Descricao, CPF_Funcionario, CPF_Cliente) 
VALUES ('Falta de suporte', '12345678901', '02345678900');

```

---

## Inserções na tabela `Avalia_Atendimento`:

```sql
INSERT INTO Avalia_Atendimento (Nota, CPF_Cliente, CPF_Funcionario) 
VALUES (5, '12345678900', '52345678901');
INSERT INTO Avalia_Atendimento (Nota, CPF_Cliente, CPF_Funcionario) 
VALUES (4, '22345678900', '32345678901');
INSERT INTO Avalia_Atendimento (Nota, CPF_Cliente, CPF_Funcionario) 
VALUES (3, '32345678900', '92345678901');
INSERT INTO Avalia_Atendimento (Nota, CPF_Cliente, CPF_Funcionario) 
VALUES (4, '42345678900', '72345678901');
INSERT INTO Avalia_Atendimento (Nota, CPF_Cliente, CPF_Funcionario) 
VALUES (5, '52345678900', '42345678901');
INSERT INTO Avalia_Atendimento (Nota, CPF_Cliente, CPF_Funcionario) 
VALUES (4, '62345678900', '12345678901');
INSERT INTO Avalia_Atendimento (Nota, CPF_Cliente, CPF_Funcionario) 
VALUES (5, '72345678900', '22345678901');
INSERT INTO Avalia_Atendimento (Nota, CPF_Cliente, CPF_Funcionario) 
VALUES (3, '82345678900', '82345678901');
INSERT INTO Avalia_Atendimento (Nota, CPF_Cliente, CPF_Funcionario) 
VALUES (2, '92345678900', '62345678901');
INSERT INTO Avalia_Atendimento (Nota, CPF_Cliente, CPF_Funcionario) 
VALUES (5, '02345678900', '02345678901');

```

---