# Transações Financeiras

## Instruções para rodar o projeto 

#### Faça o clone do repositório 
``git clone https://github.com/efrj/desafio-dev`` 

#### Entre no diretório e use o comando docker-compose up 
``cd desafio-dev`` 

``docker-compose up --build`` 

#### Após os containers do Docker estarem rodando execute os comandos para criar os bancos de dados e suas respectivas tabelas 
``docker exec -ti api.cnab rails db:create`` 

``docker exec -ti api.cnab rails db:migrate`` 

Você pode acessar a aplicação na url http://localhost:8000/ 

Faça o envio do arquivo [arquivo CNAB.txt](https://github.com/efrj/desafio-dev/blob/main/CNAB.txt) contido na raiz do projeto. 

Após o envio do arquivo CNAB.txt você poderá visualizar os dados das transações na grid abaixo do formulário. 

A documentação da API REST está na url https://documenter.getpostman.com/view/1785915/2s93m7Vg5H 

## Rodando os testes 
### Para rodar todos os testes 

``docker exec -ti api.cnab rails test`` 

### Rodar cada teste em separado 

#### Controllers

``docker exec -ti api.cnab ruby -Itest test/controllers/transactions_controller_test.rb`` 

``docker exec -ti api.cnab ruby -Itest test/controllers/uploads_controller_test.rb`` 

#### Models

``docker exec -ti api.cnab ruby -Itest test/models/company_test.rb`` 

``docker exec -ti api.cnab ruby -Itest test/models/shop_test.rb`` 

``docker exec -ti api.cnab ruby -Itest test/models/transaction_test.rb`` 

``docker exec -ti api.cnab ruby -Itest test/models/upload_test.rb`` 

#### Jobs

``docker exec -ti api.cnab ruby -Itest test/jobs/process_upload_job_test.rb`` 

#### Services

``docker exec -ti api.cnab ruby -Itest test/services/process_cnab_service_test.rb`` 