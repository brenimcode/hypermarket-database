CREATE SCHEMA trabalho_sgbd;

SET search_path TO trabalho_sgbd;

-- Criação das tabelas

CREATE TABLE Categoria
(
  Descricao VARCHAR(255) NOT NULL,
  idCategoria INT NOT NULL,
  PRIMARY KEY (idCategoria)
);

CREATE TABLE Fornecedor
(
  idFornecedor INT NOT NULL,
  Denominacao_Social VARCHAR(255) NOT NULL,
  Bairro VARCHAR(100) NOT NULL,
  Cidade VARCHAR(100) NOT NULL,
  Estado CHAR(2) NOT NULL,
  CEP VARCHAR(10) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  CNPJ CHAR(14) NOT NULL,
  PRIMARY KEY (idFornecedor)
);

CREATE TABLE Promocao
(
  idPromocao INT NOT NULL,
  Data_de_Inicio DATE NOT NULL,
  Data_do_Fim DATE NOT NULL,
  Nome VARCHAR(100) NOT NULL,
  Descricao VARCHAR(255) NOT NULL,
  Valor_Desconto DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (idPromocao)
);

CREATE TABLE ESPECIAL
(
  Valor_Minimo_Gasto_Anual DECIMAL(10, 2) NOT NULL,
  Descricao VARCHAR(255) NOT NULL,
  idCategoria INT NOT NULL,
  PRIMARY KEY (idCategoria)
);

CREATE TABLE Funcionario
(
  CPF_Funcionario CHAR(11) NOT NULL,
  Jornada_Trabalho INT NOT NULL,
  Salario DECIMAL(10, 2) NOT NULL,
  Valor_hora_extra DECIMAL(10, 2) NOT NULL,
  Funcao VARCHAR(100) NOT NULL,
  Nome VARCHAR(100) NOT NULL,
  Endereco_Residencial VARCHAR(255) NOT NULL,
  Telefone VARCHAR(15) NOT NULL,
  Data_nascimento DATE NOT NULL,
  Nivel_de_Formacao VARCHAR(100) NOT NULL,
  Estado_Civil VARCHAR(50) NOT NULL,
  PRIMARY KEY (CPF_Funcionario)
);

CREATE TABLE Gerente
(
  Data_ingresso DATE NOT NULL,
  Formacao_gerencia VARCHAR(100) NOT NULL,
  CPF_Funcionario CHAR(11) NOT NULL,
  PRIMARY KEY (CPF_Funcionario),
  FOREIGN KEY (CPF_Funcionario) REFERENCES Funcionario(CPF_Funcionario)
);

CREATE TABLE Repositor_gondola
(
  CPF_Funcionario CHAR(11) NOT NULL,
  PRIMARY KEY (CPF_Funcionario),
  FOREIGN KEY (CPF_Funcionario) REFERENCES Funcionario(CPF_Funcionario)
);

CREATE TABLE Sessao
(
  Nome VARCHAR(100) NOT NULL,
  idSessao INT NOT NULL,
  CPF_Funcionario CHAR(11) NOT NULL,
  PRIMARY KEY (idSessao),
  FOREIGN KEY (CPF_Funcionario) REFERENCES Repositor_gondola(CPF_Funcionario)
);

CREATE TABLE Produto
(
  Descricao VARCHAR(255) NOT NULL,
  idProduto INT NOT NULL,
  Unidade_de_Venda VARCHAR(50) NOT NULL,
  Foto VARCHAR(255) NOT NULL,
  Preco DECIMAL(10, 2) NOT NULL,
  Nome_do_Fabricante VARCHAR(100) NOT NULL,
  Media DECIMAL(3, 2) NOT NULL,
  idSessao INT NOT NULL,
  Estoque INT NOT NULL,
  PRIMARY KEY (idProduto),
  FOREIGN KEY (idSessao) REFERENCES Sessao(idSessao)
);

CREATE TABLE Promocao_Especial
(
  Desconto_Especial DECIMAL(10, 2) NOT NULL,
  idPromocao INT NOT NULL,
  idCategoria INT NOT NULL,
  PRIMARY KEY (idPromocao, idCategoria),
  FOREIGN KEY (idPromocao) REFERENCES Promocao(idPromocao),
  FOREIGN KEY (idCategoria) REFERENCES ESPECIAL(idCategoria)
);

CREATE TABLE Compra_Desconto
(
  idPromocao INT NOT NULL,
  PRIMARY KEY (idPromocao),
  FOREIGN KEY (idPromocao) REFERENCES Promocao(idPromocao)
);

CREATE TABLE Fornecedor_Telefone
(
  Telefone VARCHAR(15) NOT NULL,
  idFornecedor INT NOT NULL,
  PRIMARY KEY (Telefone, idFornecedor),
  FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor)
);

CREATE TABLE Cliente
(
  CPF_Cliente CHAR(11) NOT NULL,
  Nome VARCHAR(100) NOT NULL,
  Residencial VARCHAR(255) NOT NULL,
  Entrega VARCHAR(255) NOT NULL,
  Telefone VARCHAR(15) NOT NULL,
  Data_nascimento DATE NOT NULL,
  Profissao VARCHAR(100) NOT NULL,
  idCategoria INT NOT NULL,
  PRIMARY KEY (CPF_Cliente),
  FOREIGN KEY (idCategoria) REFERENCES ESPECIAL(idCategoria)
);

CREATE TABLE Pedido_de_Compra
(
  idPedido INT NOT NULL,
  Data_de_Emissao DATE NOT NULL,
  Data_de_Entrega DATE NOT NULL,
  Data_da_Previsao_de_Entrega DATE NOT NULL,
  Condicao_de_Pagamento VARCHAR(100) NOT NULL,
  Devolucao BOOLEAN NOT NULL,
  Valor_Total DECIMAL(10, 2) NOT NULL,
  Valor_Total_com_Desconto DECIMAL(10, 2) NOT NULL,
  idFornecedor INT NOT NULL,
  CPF_Funcionario CHAR(11) NOT NULL,
  PRIMARY KEY (idPedido),
  FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
  FOREIGN KEY (CPF_Funcionario) REFERENCES Gerente(CPF_Funcionario)
);

CREATE TABLE Contrato
(
  Prazo_Medio_de_Entrega VARCHAR(50) NOT NULL,
  Condicoes_de_Pagamento VARCHAR(100) NOT NULL,
  Desconto DECIMAL(10, 2) NOT NULL,
  Valor_Total_do_Ano_Anterior DECIMAL(10, 2) NOT NULL,
  idFornecedor INT NOT NULL,
  CPF_Funcionario CHAR(11) NOT NULL,
  PRIMARY KEY (idFornecedor, CPF_Funcionario),
  FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
  FOREIGN KEY (CPF_Funcionario) REFERENCES Gerente(CPF_Funcionario)
);

CREATE TABLE Compra
(
  Data DATE NOT NULL,
  Horario TIME NOT NULL,
  ValorTotal DECIMAL(10, 2) NOT NULL,
  Valor_com_desconto DECIMAL(10, 2) NOT NULL,
  Forma_pagamento VARCHAR(100) NOT NULL,
  Cupom_Fiscal INT NOT NULL,
  CPF_Cliente CHAR(11) NOT NULL,
  CPF_Funcionario CHAR(11) NOT NULL,
  PRIMARY KEY (Cupom_Fiscal, CPF_Cliente),
  FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF_Cliente),
  FOREIGN KEY (CPF_Funcionario) REFERENCES Funcionario(CPF_Funcionario)
);

CREATE TABLE Categoria_Produto
(
  idProduto INT NOT NULL,
  idCategoria INT NOT NULL,
  PRIMARY KEY (idProduto, idCategoria),
  FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
  FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

CREATE TABLE Oferece
(
  Preco_Custo DECIMAL(10, 2) NOT NULL,
  idFornecedor INT NOT NULL,
  idProduto INT NOT NULL,
  PRIMARY KEY (idFornecedor, idProduto),
  FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
  FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Contem
(
  Quantidade INT NOT NULL,
  idPedido INT NOT NULL,
  idProduto INT NOT NULL,
  PRIMARY KEY (idPedido, idProduto),
  FOREIGN KEY (idPedido) REFERENCES Pedido_de_Compra(idPedido),
  FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Desconto
(
  idProduto INT NOT NULL,
  idPromocao INT NOT NULL,
  PRIMARY KEY (idProduto, idPromocao),
  FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
  FOREIGN KEY (idPromocao) REFERENCES Promocao(idPromocao)
);

CREATE TABLE Carrinho
(
  Quantidade INT NOT NULL,
  idProduto INT NOT NULL,
  Cupom_Fiscal INT NOT NULL,
  CPF_Cliente CHAR(11) NOT NULL,
  PRIMARY KEY (idProduto, Cupom_Fiscal, CPF_Cliente),
  FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
  FOREIGN KEY (Cupom_Fiscal, CPF_Cliente) REFERENCES Compra(Cupom_Fiscal, CPF_Cliente)
);

CREATE TABLE Reclamacao
(
  Descricao VARCHAR(255) NOT NULL,
  CPF_Funcionario CHAR(11) NOT NULL,
  CPF_Cliente CHAR(11) NOT NULL,
  PRIMARY KEY (CPF_Funcionario, CPF_Cliente),
  FOREIGN KEY (CPF_Funcionario) REFERENCES Gerente(CPF_Funcionario),
  FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF_Cliente)
);

CREATE TABLE Avalia_Atendimento
(
  Nota INT NOT NULL,
  CPF_Cliente CHAR(11) NOT NULL,
  CPF_Funcionario CHAR(11) NOT NULL,
  PRIMARY KEY (CPF_Cliente, CPF_Funcionario),
  FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF_Cliente),
  FOREIGN KEY (CPF_Funcionario) REFERENCES Funcionario(CPF_Funcionario)
);

-- Inserções 

-- Categoria
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

-- Fornecedor
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

-- Promocao
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

-- Especial
INSERT INTO ESPECIAL (Valor_Minimo_Gasto_Anual, Descricao, idCategoria) VALUES (1000.00, 'Diamante', 1);
INSERT INTO ESPECIAL (Valor_Minimo_Gasto_Anual, Descricao, idCategoria) VALUES (800.00, 'Ouro', 2);
INSERT INTO ESPECIAL (Valor_Minimo_Gasto_Anual, Descricao, idCategoria) VALUES (500.00, 'Prata', 3);
INSERT INTO ESPECIAL (Valor_Minimo_Gasto_Anual, Descricao, idCategoria) VALUES (0.00, 'Comum', 4);

-- Funcionario
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
INSERT INTO Funcionario (CPF_Funcionario, Jornada_Trabalho, Salario, Valor_hora_extra, Funcao, Nome, Endereco_Residencial, Telefone, Data_nascimento, Nivel_de_Formacao, Estado_Civil) 
VALUES ('72345678902', 40, 2700.00, 50.00, 'Gerente', 'Rafael Lima', 'Rua G, 741', '11921098765', '1988-07-07', 'Ensino Médio', 'Casado');

-- Gerente
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2015-01-15', 'MBA em Gestão de Pessoas', '12345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2017-02-20', 'Especialização em Administração', '22345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2018-03-10', 'MBA em Gestão Empresarial', '32345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2019-04-25', 'MBA em Finanças', '42345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2016-05-18', 'MBA em Gestão de Negócios', '52345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2020-06-22', 'Especialização em Vendas', '62345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2014-07-30', 'MBA em Liderança', '72345678902');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2016-08-17', 'Pós-graduação em Gestão de Projetos', '82345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2021-09-12', 'Especialização em Operações', '92345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2018-10-05', 'MBA em Logística', '02345678901');
INSERT INTO Gerente (Data_ingresso, Formacao_gerencia, CPF_Funcionario)
VALUES ('2020-06-22', 'Especialização em Vendas', '72345678901');

--  Repositor_gondola
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

-- Sessao
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

-- Produto
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

-- Promocao_Especial
	-- Diamante 
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

	-- Ouro
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (10.00, 2, 2); -- Promoção 2
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (15.00, 5, 2); -- Promoção 5
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (15.00, 8, 2); -- Promoção 8

	-- Prata
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (20.00, 3, 3); -- Promoção 3
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (20.00, 7, 3); -- Promoção 7
INSERT INTO Promocao_Especial (Desconto_Especial, idPromocao, idCategoria) VALUES (10.00, 9, 3); -- Promoção 9

-- Compra_Desconto
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

-- Fornecedor_Telefone
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

-- Cliente
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

-- Pedido_de_Compra
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

-- Contrato
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

-- Compra
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


-- Categoria_Produto
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

-- Oferece
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

-- Contem
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

-- Desconto
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

-- Carrinho
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


-- Reclamacao
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

-- Avalia_Atendimento
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

-- Atualizações

	--Atualização 01
UPDATE Cliente 
SET Residencial = 'Rua Nova, 123', Entrega = 'Rua Entrega Nova, 456' 
WHERE CPF_Cliente = '12345678900';

	--Atualização 02
UPDATE Cliente 
SET Profissao = 'Desenvolvedor de Software' 
WHERE CPF_Cliente = '22345678900';

-- Consultas

	-- Consulta 01
	SELECT Produto.Descricao, SUM(Carrinho.Quantidade) AS Quantidade_Vendida
	FROM Produto
	JOIN Carrinho ON Produto.idProduto = Carrinho.idProduto
	GROUP BY Produto.Descricao
	ORDER BY Quantidade_Vendida DESC
	LIMIT 5;

	-- Consulta 02
	SELECT Cliente.Nome, SUM(Compra.ValorTotal) AS Total_Gasto
	FROM Cliente
	JOIN Compra ON Cliente.CPF_Cliente = Compra.CPF_Cliente
	GROUP BY Cliente.Nome
	ORDER BY Total_Gasto DESC
	LIMIT 1;

	-- Consulta 03
	SELECT Cliente.Nome, SUM(Compra.ValorTotal) AS Total_Compras
	FROM Cliente
	JOIN Compra ON Cliente.CPF_Cliente = Compra.CPF_Cliente
	WHERE Cliente.CPF_Cliente IN (
	    SELECT CPF_Cliente FROM Reclamacao
	)
	GROUP BY Cliente.Nome;

	-- Consulta 04
	SELECT Fornecedor.Denominacao_Social, COUNT(Oferece.idProduto) AS Total_Produtos
	FROM Fornecedor
	JOIN Oferece ON Fornecedor.idFornecedor = Oferece.idFornecedor
	GROUP BY Fornecedor.Denominacao_Social
	ORDER BY Total_Produtos DESC;

	-- Consulta 05
	SELECT DISTINCT Cliente.Nome
	FROM Cliente
	JOIN Compra ON Cliente.CPF_Cliente = Compra.CPF_Cliente
	JOIN Carrinho ON Compra.Cupom_Fiscal = Carrinho.Cupom_Fiscal AND Compra.CPF_Cliente = Carrinho.CPF_Cliente
	JOIN Produto ON Carrinho.idProduto = Produto.idProduto
	JOIN Categoria_Produto ON Produto.idProduto = Categoria_Produto.idProduto
	JOIN Categoria ON Categoria_Produto.idCategoria = Categoria.idCategoria
	WHERE Categoria.Descricao = 'Eletrônicos';

	-- Consulta 06
	SELECT Pedido_de_Compra.idPedido, SUM(Contem.Quantidade) AS Total_Itens, 
       SUM(Contem.Quantidade * Produto.Preco) AS Valor_Sem_Desconto,
       SUM((Contem.Quantidade * Produto.Preco) - (Contem.Quantidade * Produto.Preco * (Promocao.Valor_Desconto / 100))) AS Valor_Com_Desconto
	FROM Pedido_de_Compra
	JOIN Contem ON Pedido_de_Compra.idPedido = Contem.idPedido
	JOIN Produto ON Contem.idProduto = Produto.idProduto
	LEFT JOIN Desconto ON Produto.idProduto = Desconto.idProduto
	LEFT JOIN Promocao ON Desconto.idPromocao = Promocao.idPromocao
	GROUP BY Pedido_de_Compra.idPedido;

	-- Consulta 07
	SELECT Funcionario.Nome, COUNT(Reclamacao.CPF_Cliente) AS Numero_Reclamacoes
	FROM Funcionario
	JOIN Reclamacao ON Funcionario.CPF_Funcionario = Reclamacao.CPF_Funcionario
	GROUP BY Funcionario.Nome
	ORDER BY Numero_Reclamacoes DESC;

	-- Consulta 08
	SELECT Cliente.Nome, Categoria.Descricao AS Categoria_Produto, SUM(Carrinho.Quantidade * Produto.Preco) AS Total_Gasto
	FROM Cliente
	JOIN Compra ON Cliente.CPF_Cliente = Compra.CPF_Cliente
	JOIN Carrinho ON Compra.Cupom_Fiscal = Carrinho.Cupom_Fiscal AND Compra.CPF_Cliente = Carrinho.CPF_Cliente
	JOIN Produto ON Carrinho.idProduto = Produto.idProduto
	JOIN Categoria_Produto ON Produto.idProduto = Categoria_Produto.idProduto
	JOIN Categoria ON Categoria_Produto.idCategoria = Categoria.idCategoria
	GROUP BY Cliente.Nome, Categoria.Descricao;

	-- Consulta 09
	SELECT Produto.Descricao
	FROM Produto
	LEFT JOIN Carrinho ON Produto.idProduto = Carrinho.idProduto
	WHERE Carrinho.idProduto IS NULL;

	-- Consulta 10
	SELECT Funcionario.Nome, AVG(Avalia_Atendimento.nota) AS Media_Avaliacao
	FROM Funcionario
	JOIN Avalia_Atendimento ON Funcionario.CPF_Funcionario = Avalia_Atendimento.CPF_Funcionario
	GROUP BY Funcionario.Nome
	HAVING AVG(Avalia_Atendimento.nota) < 3;

	
-- Procedimento Armazenado

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

	-- Alterações para testar o Procedimento

	-- Antes
	SELECT c.CPF_Cliente, c.Nome, e.Descricao AS Categoria, c.idCategoria, COALESCE(SUM(cp.ValorTotal), 0) AS Total_Gasto
	FROM Cliente c
	LEFT JOIN Compra cp ON c.CPF_Cliente = cp.CPF_Cliente
	LEFT JOIN ESPECIAL e ON c.idCategoria = e.idCategoria
	WHERE c.CPF_Cliente = '42345678900'
	GROUP BY c.CPF_Cliente, c.Nome, c.idCategoria, e.Descricao;

	-- Utilizando a função
	CALL promover_cliente_categoria('42345678900');

	-- Depois
	SELECT c.CPF_Cliente, c.Nome, e.Descricao AS Categoria, c.idCategoria, COALESCE(SUM(cp.ValorTotal), 0) AS Total_Gasto
	FROM Cliente c
	LEFT JOIN Compra cp ON c.CPF_Cliente = cp.CPF_Cliente
	LEFT JOIN ESPECIAL e ON c.idCategoria = e.idCategoria
	WHERE c.CPF_Cliente = '42345678900'
	GROUP BY c.CPF_Cliente, c.Nome, c.idCategoria, e.Descricao;

-- Trigger

	-- Criação da Função que será usada pelo Trigger
CREATE OR REPLACE FUNCTION Notificar_Estoque_Baixo()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se o estoque está abaixo do limite (neste caso, 10 unidades)
    IF NEW.Estoque < 10 THEN
        -- Gera uma notificação de alerta
        RAISE NOTICE 'Estoque baixo para o produto %: apenas % unidades restantes', NEW.idProduto, NEW.Estoque;
    END IF;

    -- Retorna a nova linha modificada
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

	-- Criação do Trigger para Monitorar o Estoque
CREATE TRIGGER Trigger_Notificar_Estoque_Baixo
AFTER UPDATE OF Estoque ON Produto  -- Dispara após uma atualização no estoque
FOR EACH ROW
WHEN (NEW.Estoque < OLD.Estoque)  -- Garante que o trigger só roda se o estoque diminuir
EXECUTE FUNCTION Notificar_Estoque_Baixo();

	-- Teste do Trigger

	-- Antes
	SELECT idProduto, Estoque 
	FROM Produto 
	WHERE idProduto = 1;

	-- Simulando uma venda grande
	UPDATE Produto
	SET Estoque = Estoque - 45
	WHERE idProduto = 1;
