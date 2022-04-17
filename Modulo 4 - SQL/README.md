# SQL 

SQL significa “Structured Query Language”, ou “Linguagem de Consulta Estruturada”, em português. Resumidamente, é uma linguagem de programação para lidar com banco de dados relacional (baseado em tabelas). Foi criado para que vários desenvolvedores pudessem acessar e modificar dados de uma empresa simultaneamente, de maneira descomplicada e unificada.

Essa entrega apresenta apresenta os scripts para a criação de todas as tabelas utilizadas no jogo _bruvic_ dentro da pasta [src/scripts](https://github.com/SBD1/Grupo12_Bruvic/tree/main/Modulo%204%20-%20SQL/src/scripts) bem como os scripts necessários para popular-los. 

## Banco de dados

Para a criação da instância, foi configurado um contâiner utilizando o [Docker](https://www.docker.com/). Instruções de como instalar [aqui](https://docs.docker.com/get-docker/)

### Executando o banco de dados

Para executar o servidor que irá hospedar o banco de dados da aplicação, basta entrar na digitar o comando: 

```
sudo docker-compose up --build
```

A partir desse momento, seu servidor será construído e após seu término, será possível acessá-lo através do link: http://localhost:5454. Para acessar, basta utilizar as seguintes credenciais: 

- Email: admin@mydomain.com
- Senha: postgres

Após o acesso ao painel, acesse a seguinte: 

<img width="684" alt="Screen Shot 2022-03-28 at 23 54 35" src="https://user-images.githubusercontent.com/37307099/160524211-ac25d93a-2e1a-4a06-90b9-502bb0e5b2e2.png">



Preencha os campos com as seguintes informações: 

<img width="498" alt="Screen Shot 2022-03-28 at 23 55 21" src="https://user-images.githubusercontent.com/37307099/160524377-d96241be-98ad-435c-b888-548af784b0a4.png">

![Screen Shot 2022-03-29 at 00 00 45](https://user-images.githubusercontent.com/37307099/160524409-4a778f10-e3a5-4568-9b6c-de33bfba8653.png)


Obs: para o campo de senha pode ser usado "password". 

Clique em save e então você estará conectado ao banco de dados do projeto. 
