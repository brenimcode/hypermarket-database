# Criação do Banco de Dados

```sql
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
```