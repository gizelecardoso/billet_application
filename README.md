# README

### O que precisa para rodar essa aplicação:

1. Ruby - versão 3.3.0
2. PostgreSQL
3. Bundler - versão 2.5.3
4. Rubygems - versão 3.5.3

### Passo para rodar o projeto

1. Informar as credenciais do Banco de Dados no arquivo:
```
  config/database.yml
```

2. Instalar as gems do Gemfile:
```ruby
bundle install
```

3. Criar o banco:
```
rails db:create
```

4. Rodar as migrações:
```
rails db:migrate
```

5. Adicionar no arquivo:
```
.env:
  KOBANA_TOKEN = ''
```

5. Subir a aplicação:
```
bin/dev ou rails s
```

6. Aplicação disponível endereço: localhost:3000
```
localhost:3000
```

### Pontos de atenção e próximos passos:
1. Existe uma regra na API do Kobana, referente a atualização dos Boletos
  Dependendo do Banco pode ser alterado o valor(amount) OU/E data de expiração(expire_at)

    - A aplicação em questão tem os dois campos na parte da edição, mas não existe uma validação se deu certo ou não
    até porque a API retorna 204, mesmo não atualizando.
    https://suporte.kobana.com.br/article/ljnb3nyxo5-posso-alterar-a-data-de-vencimento-e-o-valor-de-um-boleto-j-emitido

2. Melhoria dos testes
  Um teste ficou comentado pendente, porque tem a ver com o item anterior de retorno da api

3. Visualização de erros
  quando os campos não são preenchidos
  validação do CPF, precisa ser passado um CPF/CNPJ válido
  Tratar retornos da API, principalmente quando eles foram erros.

4. Melhoria dos dados criados no banco, evitando assim chamar toda hora a API, principalmente nos Finds.

5. Adição de ViewComponents, para eliminar as duplicações que aconteceram nas views
  deixar as views mais enxutas renderizando componentes

6. Dockerização da aplicação

7. Capybara para testes de sistema

8. Disponibilizar em um servidor


___
