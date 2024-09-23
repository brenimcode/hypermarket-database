# PROJETO: HIPERMERCADO BANCO DE DADOS

**Universidade Federal de Uberlândia | UFU**   
**Data de Entrega:** 25/10
**Disciplina:** Sistemas de Banco de Dados
**Professora:** Maria Camila Nardini Barioni
**Grupo:** Breno Oliveira Cavalcante, Lucas de Paula Martins, Lucas Araujo, Cauê Grassi 

### Requisitos Adicionais:
 1. **Requisito 1**: 
#### Programa de Fidelidade

###### Relacionamento **Participa**:
- **Cliente** <-> **ProgramaFidelidade**
- **Descrição:** Indica que um cliente está participando de um ou mais programas de fidelidade.

###### Relacionamento **Acumula**:
- **Cliente** <-> **PontoFidelidade**
- **Descrição:** Indica os pontos que um cliente acumula como parte do programa de fidelidade.

 2. **Requisito 2**:
##### Avaliação de Produtos

###### Relacionamento **Avalia**:
- **Cliente** <-> **AvaliacaoProduto**
- **Descrição:** Indica que um cliente fez uma avaliação de um produto.

###### Relacionamento **AvaliaProduto**:
- **AvaliacaoProduto** <-> **Produto**
- **Descrição:** Indica qual produto foi avaliado pelo cliente.
