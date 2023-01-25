# LEIA-ME

This README would normally document whatever steps are necessary to get the
application up and running.

##  Versão das Principais Gems
- `ruby` version: 3.1
- `rails` version: 7.0.4
- `rails_admin` version: 3.1.1

# Configurações

Baixe o repositório rails_admin_base do ramo principal (branch main)
```
$ git clone -b main git@github.com:dailson-igo/rails_admin_base
```

Após baixar, entre no diretório
```
$ cd rails_admin_base
```

E execute os comandos a seguir dentro da raiz do diretório do projeto
```
$ bundle install && yarn add sass && yarn build:css && rails db:create && rails db:migrate && rails db:seed
```

Crie seu modelo, reinicie o serviço que o Rails Admin incluirá automaticamente no menu principal do site
```
$ rails generate model Lotacao \
descricao:string \
sigla:string{20} \
ativa:boolean
```