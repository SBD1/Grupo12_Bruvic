# Como executar o projeto

1. Clone este repositório:

```
Com HTTPS: 
$ git clone https://github.com/SBD1/Grupo12_Bruvic.git

ou com SSH:
$ git clone git@github.com:SBD1/Grupo12_Bruvic.git
```

2. O projeto é executado dentro de contâineres docker. Para executar pela primeira vez rode

```
$ make build
```

Nas outras execuções basta rodar. **Este terminal deverá ficar sendo executado para rodar os outros comandos a seguir**:

```
$ make up
```

3. Para criar as tabelas do banco de dados execute o comando em outro terminal (OBS: É necessário que os containeres estejam rodando):

```
$ make init-db
```

4. Para popular o banco de dados, basta rodar o seguinte comando em outro terminal (OBS: É necessário que os containeres estejam rodando):

```
$ make populate-db
```

5. Quando todo o ambiente for configurado, será possível executar o terminal do jogo (OBS: É necessário que os conteineres estejam rodando):

```
$ make start-game
```
