# Descrição do Mapeamento MR

### Usamos essas regras de mapeamento a priori:

- **Simplicidade**: Qual abordagem resulta em um esquema mais simples e fácil de entender?
- **Integridade dos Dados**: Qual mapeamento ajuda a garantir a integridade dos dados e evita redundâncias?

## Relacionamentos

- **(M:N)**: Criamos uma tabela adicional apenas para o relacionamento, contendo as chaves primárias de ambas as tabelas como chaves estrangeiras.
- **(1:N)**: Em um relacionamento 1, a chave primária da tabela do lado 1 é colocada como chave estrangeira na tabela do lado N.
- **1:1**: Em um relacionamento 1:1, escolhemos arbitrariamente uma das chaves primárias para ser a chave estrangeira na outra tabela.

## Organização de Atributos

- **Atributos Compostos**: Atributos que podem ser subdivididos em outros atributos são desmembrados, e cada parte se torna um atributo separado na tabela.
- **Atributos Multivalorados**: Atributos que podem ter múltiplos valores são transformados em tabelas independentes, onde cada valor é armazenado como uma nova linha, referenciando a tabela original.

## Herança

### Estrutura do Modelo

Neste modelo, temos uma tabela chamada **FUNCIONARIO**, onde o CPF é a chave primária. Esta tabela contém os atributos comuns a todos os funcionários.

As subentidades que herdam os atributos da tabela FUNCIONARIO são:

- **GERENTE**
- **REPOSITOR_GONDULA**
- **ATENDENTE_CAIXA**

### Mapeamento MER para MR

A abordagem utilizada é a **tabela por hierarquia**, que é apropriada para cenários onde uma tabela base contém atributos comuns a subtipos de uma entidade. Nesse mapeamento:

- A tabela FUNCIONARIO atua como a tabela pai, consolidando informações comuns.
- As tabelas GERENTE, REPOSITOR_GONDULA e ATENDENTE_CAIXA funcionam como tabelas filhas, cada uma podendo incluir atributos adicionais específicos.

### Vantagens

1. **Reutilização de Dados**: Minimiza a redundância ao compartilhar atributos comuns.
2. **Flexibilidade**: Facilita a adição de novas subentidades.
3. **Organização**: Mantém uma estrutura clara e lógica para diferentes tipos de funcionários.