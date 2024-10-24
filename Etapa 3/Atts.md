# Atualizações

```sql
-- Atualizações

	--Atualização 01
UPDATE Cliente 
SET Residencial = 'Rua Nova, 123', Entrega = 'Rua Entrega Nova, 456' 
WHERE CPF_Cliente = '12345678900';

	--Atualização 02
UPDATE Cliente 
SET Profissao = 'Desenvolvedor de Software' 
WHERE CPF_Cliente = '22345678900';
```

---

## Atualização 01:

- **Descrição**: Esta atualização modifica os endereços do cliente cujo CPF é **`12345678900`**. O endereço residencial será alterado para **"Rua Nova, 123"** e o endereço de entrega será alterado para **"Rua Entrega Nova, 456"**. Essa operação é útil para casos onde o cliente mudou de endereço tanto para residência quanto para entrega.

---

## Atualização 02:

- **Descrição**: Esta atualização altera a profissão do cliente com CPF **`22345678900`** para **"Desenvolvedor de Software"**. É útil para atualizar as informações profissionais do cliente, mantendo os dados do sistema sempre atualizados.