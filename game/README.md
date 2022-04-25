# Como executar o projeto

1. O projeto é executado dentro de contâineres docker. Para executar pela primeira vez rode

```
$ make build
```

Nas outras execuções basta rodar:

```
$ make up
```

2. Para criar as tabelas do banco de dados execute o comando em outro terminal (OBS: É necessário que os containeres estejam rodando):

```
$ make init-db
```

3. Para popular o banco de dados, basta rodar o seguinte comando em outro terminal (OBS: É necessário que os containeres estejam rodando):

```
$ make populate-db
```

4. Quando todo o ambiente for configurado, será possível executar o terminal do jogo (OBS: É necessário que os conteineres estejam rodando):

```
$ make start-game
```
