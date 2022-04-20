# Como executar o projeto

O projeto é executado dentro de contâiners docker. Para executar pela primeira vez rode


```
$ docker-compose up --build
```

Para criar as tabelas do banco de dados execute o comando em outro terminal (OBS: É necessário que os containers estejam rodando):

```
$ make init-db
```

Para popular o banco de dados, basta rodar o seguinte comando em outro terminal (OBS: É necessário que os containers estejam rodando):

```
$ make populate-db
```