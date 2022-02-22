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

---

### Definição Lógica

#### Mapa
**ID** - Atributo identificador da relação.   
**Largura** - Largura, em blocos, do mapa.   
**Altura** - Altura, em blocos, do mapa   

#### Bloco
**Eixo_X** - Posição no eixo horizontal. Chave composta.   
**Eixo_Y** - Posição no eixo vertical. Chave composta.   
**Mapa** - Identificador para a relação de Mapa.   
**Interação** - Especificação da possível interação com o bloco.   
**Tipo*** - Especificação do tipo do bloco.   
**Spawn_Item** - Atributo que define o surgimento ou não de itens no bloco.   

#### Gatilho
**Eixo_X** - Posição no eixo horizontal. Chave composta.   
**Eixo_Y** - Posição no eixo vertical. Chave composta.   
**Mapa** - Identificador para a relação de Mapa.   
**Ação** - Especificação de ação de reação do bloco gatilho.   

#### NPC
**ID** - Atributo identificador da relação.   
**Eixo_X** - Posição no eixo horizontal. Chave composta para Bloco.   
**Eixo_Y** - Posição no eixo vertical. Chave composta para Bloco.   
**Tipo** - Especificação para o tipo de NPC.
**Vida** - Pontos de vida do NPC.   
**Dano** - Quantidade de dano fornecida para cada ataque.   

#### Negociante
**NPC** - Identificador para a relação de NPC. Chave primária.

#### Item
**ID** - Atributo identificador da relação.   
**Negociante** - Identificador para a tabela de Negociante.   
**Bloco** - Identificador para a tabela de Bloco.   
**Nome** - Nome do item.   
**Peso** - Peso do item.   
**Tipo** - Especificação do tipo do item.   
**Mochila** - Identificador para a relação de Mochila.   

#### Bugiganga
**Item** - Identificador para a relação de Item. v   
**Descrição** - Descrição da bugiganga.   
**Função** - Função da bugiganga.   
**É_Item_História** - Atributo de controle para informar a importância da bugiganga para a história do jogo.   

#### Poção
**Item** - Identificador para a relação de Item. Chave primária.   
**Recuperação** - Quantidade de pontos de vida recuperados.   

#### Equipamento
**Item** - Identificador para a relação de Item. Chave primária.   
**Durabilidade** - A durabilidade da armadura.   
**Classe de Armadura** - A quantidade de CA fornecida pela armadura.   
**Dano** - O dano da arma.   
**Alcance** - O alcance da arma.   
**É_Armadura** - Atributo de controle para informar o tipo do equipamento.   
**É_Arma** - Atributo de controle para informar o tipo do equipamento.   

#### Venda
**Negociante** - Identificador para a relação de Negociante. Chave composta.   
**Item** - Identificador para a relação de Item. Chave composta.    
**Personagem** - Identificador para a relação de Personagem. Chave composta.   
**Valor** - Valor do câmbio da venda realizada.

#### Mochila
**ID** - Atributo identificador da relação.   
**Capacidade** - Gramatura máxima de que cabe na mochila.
**Personagem** - Identificador para a relação de Personagem.   

#### Habilidade
**ID** - Atributo identificador da relação.   
**Tipo** - Especificação do tipo da habilidade.   
**Nome** - Nome da habilidade.   
**Descrição** - Descrição da habilidade.   
**Nível** - Nível da habilidade.   

#### Ataque
**Habilidade** - Identificador para a relação de Habilidade. Chave primária.  
**Dano** - Dano causado pelo ataque.   

#### Cura
**Habilidade** - Identificador para a relação de Habilidade. Chave primária.   
**Recuperação** - Quantidade de pontos de vida recuperados.   

#### Truque
**Habilidade** - Identificador para a relação de Habilidade. Chave primária.  
**Stun** - Quantidade de turnos em que o receptor do truque ficará incapacitado.   

#### Magia
**Habilidade** - Identificador para a relação de Habilidade. Chave primária.  
**Modificador** - Buffer ou debuffer temporário de alguma característica.   

#### Antecedente
**Nome** - Nome do antecedente. Chave primária.   
**Item_1** - Primeiro item fornecido pelo antecedente.   
**Item_2** - Segundo item fornecido pelo antecedente.   
**Item_3** - Terceiro item fornecido pelo antecedente.   
**Item_4** - Quarto item fornecido pelo antecedente.   
**Descrição** - Descrição do antecedente.   
**Dinheiro** - Dinheiro fornecido pelo antecedente.   

#### Personagem_Antecedente
**Antecedente** - Identificador para a relação de Antecedente. Chave composta.   
**Personagem** - Identificador para a relação de Personagem. Chave composta.   

#### Personagem
**ID** - Atributo identificador da relação.   
**Vida** - Pontos de vida do personagem.
**Experiência** - Quantidade atual de experiência do personagem.   
**Nível** - Nível do personagem.   
**Nome** - Nome do personagem.   
**Destreza** - Pontos de destreza do personagem.   
**Força** - Pontos de força do personagem.   
**Constituição** - Pontos de constituição do personagem.   
**Carisma** - Pontos de carisma do personagem.   
**Sabedoria** - Pontos de sabedoria do personagem.   
**Inteligência** - Pontos de inteligência do personagem.   
**Classe de Armadura** - Quantidade de armadura do personagem.

#### Humano
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
**Bônus_Destreza** - Bônus fornecido para o campo de destreza.  
**Bônus_Força** - Bônus fornecido para o campo de força.  
**Bônus_Constituição** - Bônus fornecido para o campo de constituição.  
**Bônus_Carisma** - Bônus fornecido para o campo de carisma.  
**Bônus_Sabedoria** - Bônus fornecido para o campo de sabedoria.  
**Bônus_Inteligência** - Bônus fornecido para o campo de inteligência.  


#### Anão
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
**Bônus_Força** - Bônus fornecido para o campo de força.  
**Bônus_Constituição** - Bônus fornecido para o campo de constituição.  

#### Meio_Elfo
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
**Bônus_Destreza** - Bônus fornecido para o campo de destreza.  
**Bônus_Sabedoria** - Bônus fornecido para o campo de sabedoria.  

#### Draconato
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
**Bônus_Carisma** - Bônus fornecido para o campo de carisma.  
**Bônus_Inteligência** - Bônus fornecido para o campo de inteligência.  

#### Guerreiro
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
**Bônus_CA** - Bônus fornecido para a classe de armadura.   
**Bônus_Ataque** - Bônus de dano fornecido ao ataque.  

#### Mago
**Personagem** - Identificador para a relação de Personagem. Chave primária.   

#### Mago_Magia
**Mago** - Identificador para a relação de Mago. Chave composta.   
**Magia** - Identificador para a relação de Magia. Chave composta. 

#### Clérigo
**Personagem** - Identificador para a relação de Personagem. Chave primária.  

#### Clérigo_Truque
**Clérigo** - Identificador para a relação de Clérigo. Chave composta.    
**Truque** - Identificador para a relação de Truque. Chave composta.   

#### Clérigo_Cura
**Clérigo** - Identificador para a relação de Clérigo. Chave composta.    
**Cura** - Identificador para a relação de Cura. Chave composta.   

#### Definição_Personagem
**Personagem** - Identificador para a relação de Personagem. Chave primária.      
**Classe** - Definição da classe do personagem.
**Raça** - Definição da raça do personagem.

---

### Definição de formato de dados
