walmart-store
=============
## Estrutura
Projeto usando rails para expor uma API REST (json), autenticada, de produtos e categorias. Backbone com underscore (templates) 
utilizado para renderizar o cadastro de produtos no client-side (browser).

## Dependências sistêmicas
* memcached 1.4.5
* mongodb 2.4.1

## Para gerar base de demo
    rake db:seed

## Senha http basic auth
* usuario: dummy
* senha: drwho

## Cache
Seguindo a estratégia de 'boneca russa', com cache dem vários níveis, temos em nível de 
modelo com memcache e em nível web com etag, last_modified e expires.

## Integração com buscapé e uol shopping
Uma url diferenciada expondo um xml, sem autenticação do catálogo de produtos.
[http://localhost:3000/api/products/export.xml](http://localhost:3000/api/products/export.xml)

## Cadastro de categoria
Não implementado.
