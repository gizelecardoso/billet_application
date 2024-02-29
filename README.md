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

___
