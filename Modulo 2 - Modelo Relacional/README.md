# Modelo Relacional

O modelo relacional é um modelo de dados de implementação, adequado a ser o modelo intermediário entre o alto e baixo nível de um Sistema Gerenciador de Banco de Dados (SGBD), que se baseia no princípio de que todos os dados estão armazenados em tabelas.

## Mapeamento

O Mapeamento desenvolvido a partir do [DER](https://github.com/SBD1/Grupo12_Bruvic/blob/main/Modulo%201%20-%20DER/README.md) pode ser visualizado na seguinte imagem:

![Mapeamento Relacional](https://github.com/SBD1/Grupo12_Bruvic/blob/d37338b66ec5e65cb7960645a11dd74eacfd0095/Modulo%202%20-%20Modelo%20Relacional/mr_bruvic_v2.png)

#### Observação

Caso a visualização do documento esteja comprometida, é possível visualizar a imagem na íntegra por meio deste [link](https://github.com/SBD1/Grupo12_Bruvic/blob/d37338b66ec5e65cb7960645a11dd74eacfd0095/Modulo%202%20-%20Modelo%20Relacional/mr_bruvic_v2.png).

## Especificação do Domínio da Aplicação

O Mapeamento desenvolvido se consiste no modelo relacional criado para um jogo MUD com temática definida pelo universo de [Caverna do Dragão](https://pt.wikipedia.org/wiki/Dungeons_%26_Dragons). O jogo possui sua própria história e narrativa original, é possível visualizar mais detalhes sobre a história do jogo por meio deste [link](https://github.com/SBD1/Grupo12_Bruvic/blob/main/README.md).

## Especificação do Domínio de Atributo

### Definição das relações

#### Mapa
Relação que representa um mapa do jogo. 

#### Bloco
Relação que representa um bloco do jogo.

#### Gatilho
Relação que representa blocos com interação.

#### NPC
Relação que representa personagens não jogáveis.

#### Negociante
Relação que representa uma especialização de tipo de NPC.

#### Item
Relação que representa um item do jogo.

#### Bugiganga
Relação que representa uma especialização de tipo de Item.

#### Poção
Relação que representa uma especialização de tipo de Item.

#### Equipamento
Relação que representa uma especialização de tipo de Item.

#### Venda
Relação que representa uma transação de compra e venda de itens no jogo.

#### Mochila
Relação que representa uma mochila do jogo, isto é, o equipamento responsável pela carga de outros itens.

#### Habilidade
Relação que representa uma ação ativa do personagem no jogo.

#### Ataque
Relação que representa uma especialização de tipo de Habilidade.

#### Cura
Relação que representa uma especialização de tipo de Habilidade.

#### Truque
Relação que representa uma especialização de tipo de Habilidade.

#### Magia
Relação que representa uma especialização de tipo de Habilidade.

#### Antecedente
Relação que representa o antecedente do personagem, isto é, uma definição de história de background do personagem.

#### Personagem_Antecedente
Relação responsável por conectar instâncias de Antecedente a instâncias de Personagem.

#### Personagem
Relação que representa um personagem jogável do jogo.

#### Humano
Relação que representa uma especialização de raça de Personagem.

#### Anão
Relação que representa uma especialização de raça de Personagem.

#### Meio_Elfo
Relação que representa uma especialização de raça de Personagem.

#### Draconato
Relação que representa uma especialização de raça de Personagem.

#### Guerreiro
Relação que representa uma especialização de classe de Personagem.

#### Mago
Relação que representa uma especialização de classe de Personagem.

#### Mago_Magia
Relação responsável por conectar instâncias de Mago a instâncias de Magia.

#### Clérigo
Relação que representa uma especialização de classe de Personagem.

#### Clérigo_Truque
Relação responsável por conectar instâncias de Clérigo a instâncias de Truque.

#### Clérigo_Cura
Relação responsável por conectar instâncias de Clérigo a instâncias de Cura.

#### Definição_Personagem
Relação responsável por conectar instãncias de Personagem a instãncias de classe e raça.


### Definição Lógica

#### Mapa
**ID** - Atributo identificador da relação.   
**Largura** - Largura, em blocos, do mapa.   
**Altura** - Altura, em blocos, do mapa   

#### Bloco
**Eixo_X** - Posição no eixo horizontal.   
**Eixo_Y** - Posição no eixo vertical.   
**Mapa** - Identificador para a relação de Mapa.   
**Interação** - Especificação da possível interação com o bloco.   
**Tipo*** - Especificação do tipo do bloco.   
**Spawn_Item** - Atributo que define o surgimento ou não de itens no bloco.   

#### Gatilho


#### NPC


#### Negociante


#### Item


#### Bugiganga


#### Poção


#### Equipamento


#### Venda


#### Mochila


#### Habilidade


#### Ataque


#### Cura


#### Truque


#### Magia


#### Antecedente


#### Personagem_Antecedente


#### Personagem


#### Humano


#### Anão


#### Meio_Elfo


#### Draconato


#### Guerreiro


#### Mago


#### Mago_Magia


#### Clérigo


#### Clérigo_Truque


#### Clérigo_Cura


#### Definição_Personagem


### Definição de formato de dados
