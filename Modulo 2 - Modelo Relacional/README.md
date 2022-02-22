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
<br/>

#### Bloco
Relação que representa um bloco do jogo.   
<br/>

#### Gatilho
Relação que representa blocos com interação.   
<br/>

#### NPC 
Relação que representa personagens não jogáveis.   
<br/>

#### Negociante
Relação que representa uma especialização de tipo de NPC.   
<br/>

#### Item
Relação que representa um item do jogo.   
<br/>

#### Bugiganga
Relação que representa uma especialização de tipo de Item.   
<br/>

#### Poção
Relação que representa uma especialização de tipo de Item.   
<br/>

#### Equipamento
Relação que representa uma especialização de tipo de Item.   
<br/>

#### Venda
Relação que representa uma transação de compra e venda de itens no jogo.   
<br/>

#### Mochila
Relação que representa uma mochila do jogo, isto é, o equipamento responsável pela carga de outros itens.   
<br/>

#### Habilidade
Relação que representa uma ação ativa do personagem no jogo.   
<br/>

#### Ataque 
Relação que representa uma especialização de tipo de Habilidade.   
<br/>

#### Cura
Relação que representa uma especialização de tipo de Habilidade.   
<br/>

#### Truque
Relação que representa uma especialização de tipo de Habilidade.   
<br/>

#### Magia
Relação que representa uma especialização de tipo de Habilidade.   
<br/>

#### Antecedente
Relação que representa o antecedente do personagem, isto é, uma definição de história de background do personagem.   
<br/>

#### Personagem_Antecedente
Relação responsável por conectar instâncias de Antecedente a instâncias de Personagem.   
<br/>

#### Personagem
Relação que representa um personagem jogável do jogo.   
<br/>

#### Humano
Relação que representa uma especialização de raça de Personagem.   
<br/>

#### Anão
Relação que representa uma especialização de raça de Personagem.   
<br/>

#### Meio_Elfo
Relação que representa uma especialização de raça de Personagem.   
<br/>

#### Draconato
Relação que representa uma especialização de raça de Personagem.   
<br/>

#### Guerreiro
Relação que representa uma especialização de classe de Personagem.   
<br/>

#### Mago
Relação que representa uma especialização de classe de Personagem.   
<br/>

#### Mago_Magia
Relação responsável por conectar instâncias de Mago a instâncias de Magia.   
<br/>

#### Clérigo
Relação que representa uma especialização de classe de Personagem.   
<br/>

#### Clérigo_Truque
Relação responsável por conectar instâncias de Clérigo a instâncias de Truque.   
<br/>

#### Clérigo_Cura
Relação responsável por conectar instâncias de Clérigo a instâncias de Cura.   
<br/>

#### Definição_Personagem
Relação responsável por conectar instãncias de Personagem a instãncias de classe e raça.    
<br/>

---

### Definição Lógica

#### Mapa
**ID** - Atributo identificador da relação.   
**Largura** - Largura, em blocos, do mapa.   
**Altura** - Altura, em blocos, do mapa   
<br/>

#### Bloco
**Eixo_X** - Posição no eixo horizontal. Chave composta.   
**Eixo_Y** - Posição no eixo vertical. Chave composta.   
**Mapa** - Identificador para a relação de Mapa.   
**Interação** - Especificação da possível interação com o bloco.   
**Tipo*** - Especificação do tipo do bloco.   
**Spawn_Item** - Atributo que define o surgimento ou não de itens no bloco.   
<br/>

#### Gatilho
**Eixo_X** - Posição no eixo horizontal. Chave composta.   
**Eixo_Y** - Posição no eixo vertical. Chave composta.   
**Mapa** - Identificador para a relação de Mapa.   
**Ação** - Especificação de ação de reação do bloco gatilho.   
<br/>

#### NPC
**ID** - Atributo identificador da relação.   
**Eixo_X** - Posição no eixo horizontal. Chave composta para Bloco.   
**Eixo_Y** - Posição no eixo vertical. Chave composta para Bloco.   
**Tipo** - Especificação para o tipo de NPC.
**Vida** - Pontos de vida do NPC.   
**Dano** - Quantidade de dano fornecida para cada ataque.   
<br/>

#### Negociante
**NPC** - Identificador para a relação de NPC. Chave primária.   
<br/>

#### Item
**ID** - Atributo identificador da relação.   
**Negociante** - Identificador para a tabela de Negociante.   
**Bloco** - Identificador para a tabela de Bloco.   
**Nome** - Nome do item.   
**Peso** - Peso do item.   
**Tipo** - Especificação do tipo do item.   
**Mochila** - Identificador para a relação de Mochila.   
<br/>

#### Bugiganga
**Item** - Identificador para a relação de Item. v   
**Descrição** - Descrição da bugiganga.   
**Função** - Função da bugiganga.   
**É_Item_História** - Atributo de controle para informar a importância da bugiganga para a história do jogo.   
<br/>

#### Poção
**Item** - Identificador para a relação de Item. Chave primária.   
**Recuperação** - Quantidade de pontos de vida recuperados.   
<br/>

#### Equipamento
**Item** - Identificador para a relação de Item. Chave primária.   
**Durabilidade** - A durabilidade da armadura.   
**Classe de Armadura** - A quantidade de CA fornecida pela armadura.   
**Dano** - O dano da arma.   
**Alcance** - O alcance da arma.   
**É_Armadura** - Atributo de controle para informar o tipo do equipamento.   
**É_Arma** - Atributo de controle para informar o tipo do equipamento.   
<br/>

#### Venda
**Negociante** - Identificador para a relação de Negociante. Chave composta.   
**Item** - Identificador para a relação de Item. Chave composta.    
**Personagem** - Identificador para a relação de Personagem. Chave composta.   
**Valor** - Valor do câmbio da venda realizada.   
<br/>

#### Mochila
**ID** - Atributo identificador da relação.   
**Capacidade** - Gramatura máxima de que cabe na mochila.   
**Personagem** - Identificador para a relação de Personagem.   
<br/>

#### Habilidade
**ID** - Atributo identificador da relação.   
**Tipo** - Especificação do tipo da habilidade.   
**Nome** - Nome da habilidade.   
**Descrição** - Descrição da habilidade.   
**Nível** - Nível da habilidade.   
<br/>

#### Ataque
**Habilidade** - Identificador para a relação de Habilidade. Chave primária.  
**Dano** - Dano causado pelo ataque.   
<br/>

#### Cura
**Habilidade** - Identificador para a relação de Habilidade. Chave primária.   
**Recuperação** - Quantidade de pontos de vida recuperados.   
<br/>

#### Truque
**Habilidade** - Identificador para a relação de Habilidade. Chave primária.  
**Stun** - Quantidade de turnos em que o receptor do truque ficará incapacitado.   
<br/>

#### Magia
**Habilidade** - Identificador para a relação de Habilidade. Chave primária.  
**Modificador** - Buffer ou debuffer temporário de alguma característica.   
<br/>

#### Antecedente
**Nome** - Nome do antecedente. Chave primária.   
**Item_1** - Primeiro item fornecido pelo antecedente.   
**Item_2** - Segundo item fornecido pelo antecedente.   
**Item_3** - Terceiro item fornecido pelo antecedente.   
**Item_4** - Quarto item fornecido pelo antecedente.   
**Descrição** - Descrição do antecedente.   
**Dinheiro** - Dinheiro fornecido pelo antecedente.   
<br/>

#### Personagem_Antecedente
**Antecedente** - Identificador para a relação de Antecedente. Chave composta.   
**Personagem** - Identificador para a relação de Personagem. Chave composta.   
<br/>

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
<br/>

#### Humano
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
**Bônus_Destreza** - Bônus fornecido para o campo de destreza.  
**Bônus_Força** - Bônus fornecido para o campo de força.  
**Bônus_Constituição** - Bônus fornecido para o campo de constituição.  
**Bônus_Carisma** - Bônus fornecido para o campo de carisma.  
**Bônus_Sabedoria** - Bônus fornecido para o campo de sabedoria.  
**Bônus_Inteligência** - Bônus fornecido para o campo de inteligência.  
<br/>

#### Anão
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
**Bônus_Força** - Bônus fornecido para o campo de força.  
**Bônus_Constituição** - Bônus fornecido para o campo de constituição.  
<br/>

#### Meio_Elfo
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
**Bônus_Destreza** - Bônus fornecido para o campo de destreza.  
**Bônus_Sabedoria** - Bônus fornecido para o campo de sabedoria.  
<br/>

#### Draconato
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
**Bônus_Carisma** - Bônus fornecido para o campo de carisma.  
**Bônus_Inteligência** - Bônus fornecido para o campo de inteligência.  
<br/>

#### Guerreiro
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
**Bônus_CA** - Bônus fornecido para a classe de armadura.   
**Bônus_Ataque** - Bônus de dano fornecido ao ataque.  
<br/>

#### Mago
**Personagem** - Identificador para a relação de Personagem. Chave primária.   
<br/>

#### Mago_Magia
**Mago** - Identificador para a relação de Mago. Chave composta.   
**Magia** - Identificador para a relação de Magia. Chave composta.   
<br/>

#### Clérigo
**Personagem** - Identificador para a relação de Personagem. Chave primária.  
<br/>

#### Clérigo_Truque
**Clérigo** - Identificador para a relação de Clérigo. Chave composta.    
**Truque** - Identificador para a relação de Truque. Chave composta.   
<br/>

#### Clérigo_Cura
**Clérigo** - Identificador para a relação de Clérigo. Chave composta.    
**Cura** - Identificador para a relação de Cura. Chave composta.   
<br/>

#### Definição_Personagem
**Personagem** - Identificador para a relação de Personagem. Chave primária.      
**Classe** - Definição da classe do personagem.   
**Raça** - Definição da raça do personagem.   
<br/>

---

### Definição de formato de dados

#### Mapa
**ID** - Inteiro positivo.   
**Largura** - Inteiro dentro do intervalo [1, 512].   
**Altura** - Inteiro dentro do intervalo [1, 512].   
<br/>

#### Bloco
**Eixo_X** - Inteiro dentro do intervalo [-256, 255].   
**Eixo_Y** - Inteiro dentro do intervalo [-256, 255].   
**Mapa** - Inteiro positivo   
**Interação** - Atributo de texto.   
**Tipo*** - Atributo de texto.       
**Spawn_Item** - Atributo booleano.   
<br/>

#### Gatilho
**Eixo_X** - Inteiro dentro do intervalo [-256, 255]..   
**Eixo_Y** - Inteiro dentro do intervalo [-256, 255]..   
**Mapa** - Inteiro positivo.   
**Ação** - Atributo de texto.   
<br/>

#### NPC
**ID** - Inteiro positibo.   
**Eixo_X** - Inteiro dentro do intervalo [-256, 255].   
**Eixo_Y** - Inteiro dentro do intervalo [-256, 255].   
**Tipo** - Atributo de texto.
**Vida** - Inteiro positivo e maior que 10.   
**Dano** - Inteiro positivo e maior que 5.   
<br/>

#### Negociante
**NPC** - Inteiro positivo. 
<br/>

#### Item
**ID** - Inteiro positivo.   
**Negociante** - Inteiro positivo.   
**Bloco** - Tupla de inteiros dentro do intervalo [-256, 255].   
**Nome** - Atributo de texto.   
**Peso** - Atributo de texto.   
**Tipo** - Atributo de texto.   
**Mochila** - Inteiro positivo.   
<br/>

#### Bugiganga
**Item** - Inteiro positivo.   
**Descrição** - Atributo de texto.   
**Função** - Atributo de texto.   
**É_Item_História** - Atributo booleano.   
<br/>

#### Poção
**Item** - Inteiro positivo.   
**Recuperação** - Inteiro positivo.   
<br/>

#### Equipamento
**Item** - Inteiro positivo.   
**Durabilidade** - Inteiro positivo.   
**Classe de Armadura** - Inteiro positivo.   
**Dano** - Inteiro positivo.   
**Alcance** - Inteiro positivo.   
**É_Armadura** - Atributo booleano.   
**É_Arma** - Atributo booleano.   
<br/>

#### Venda
**Negociante** - Inteiro positivo.   
**Item** - Inteiro positivo.    
**Personagem** - Inteiro positivo.   
**Valor** - Inteiro positivo.   
<br/>

#### Mochila
**ID** - Inteiro positivo.   
**Capacidade** - Ponto flutuante positivo.   
**Personagem** - Inteiro positivo.   
<br/>

#### Habilidade
**ID** - Inteiro positivo.   
**Tipo** - Atributo de texto.   
**Nome** - Atributo de texto.   
**Descrição** - Atributo de texto.   
**Nível** - Inteiro Positivo.   
<br/>

#### Ataque
**Habilidade** - Inteiro positivo.     
**Dano** - Inteiro positivo.   
<br/>

#### Cura
**Habilidade** - Inteiro positivo.   
**Recuperação** - Inteiro positivo.   
<br/>

#### Truque
**Habilidade** - Inteiro positivo.  
**Stun** - Inteiro positivo.   
<br/>

#### Magia
**Habilidade** - Inteiro positivo.  
**Modificador** - Inteiro positivo.   
<br/>

#### Antecedente
**Nome** - Atributo de texto.   
**Item_1** - Inteiro positivo.   
**Item_2** - Inteiro positivo.   
**Item_3** - Inteiro positivo.   
**Item_4** - Inteiro positivo.   
**Descrição** - Atributo de texto.   
**Dinheiro** - Inteiro positivo.   
<br/>

#### Personagem_Antecedente
**Antecedente** - Atributo de texto.   
**Personagem** - Inteiro positivo.   
<br/>

#### Personagem
**ID** - Inteiro positivo.   
**Vida** - Inteiro positivo.   
**Experiência** - Inteiro positivo.   
**Nível** - Inteiro positivo..   
**Nome** - Atributo de texto.   
**Destreza** - Inteiro positivo.   
**Força** - Inteiro positivo.   
**Constituição** - Inteiro positivo.   
**Carisma** - Inteiro positivo.   
**Sabedoria** - Inteiro positivo.   
**Inteligência** - Inteiro positivo.   
**Classe de Armadura** - Inteiro positivo.   
<br/>

#### Humano
**Personagem** - Inteiro positivo.   
**Bônus_Destreza** - Inteiro positivo.  
**Bônus_Força** - Inteiro positivo.  
**Bônus_Constituição** - Inteiro positivo.  
**Bônus_Carisma** - Inteiro positivo.  
**Bônus_Sabedoria** - Inteiro positivo.  
**Bônus_Inteligência** - Inteiro positivo.  
<br/>

#### Anão
**Personagem** - Inteiro positivo.   
**Bônus_Força** - Inteiro positivo.  
**Bônus_Constituição** - Inteiro positivo.  
<br/>

#### Meio_Elfo
**Personagem** - Inteiro positivo.   
**Bônus_Destreza** - Inteiro positivo.  
**Bônus_Sabedoria** - Inteiro positivo.  
<br/>

#### Draconato
**Personagem** - Inteiro positivo.   
**Bônus_Carisma** - Inteiro positivo.  
**Bônus_Inteligência** - Inteiro positivo.  
<br/>

#### Guerreiro
**Personagem** - Inteiro positivo.   
**Bônus_CA** - Inteiro positivo.   
**Bônus_Ataque** - Inteiro positivo.  
<br/>

#### Mago
**Personagem** - Inteiro positivo.   
<br/>

#### Mago_Magia
**Mago** - Inteiro positivo.   
**Magia** - Inteiro positivo.   
<br/>

#### Clérigo
**Personagem** - Inteiro positivo.  
<br/>

#### Clérigo_Truque
**Clérigo** - Inteiro positivo.    
**Truque** - Inteiro positivo.   
<br/>

#### Clérigo_Cura
**Clérigo** - Inteiro positivo.    
**Cura** - Inteiro positivo.   
<br/>

#### Definição_Personagem
**Personagem** - Inteiro positivo.      
**Classe** - Atributo de texto.   
**Raça** - Atributo de texto.   
<br/>
