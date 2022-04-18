# Módulo 5 - Álgebra Relacional, Triggers, Storage Procedure e Transações

No presente módulo, houve a continuação do desenvolvimento do trabalho do grupo, referentes aos conteúdos ministrados no módulo 5, que são Álgebra Relacional, Triggers, Storage Procedure e Transações, que guiaram a implementação e aperfeiçoamento dos scripts. Em adição, a este módulo, houve a atualização da [versão número 7](../Modulo%201%20-%20DER/der_bruvic_v7.png) do diagrama entidade e relacionamento de acordo com o desenvolvimento e as necessidades do projeto. 

## Triggers e Storage Procedure
Os gatilhos, ou triggers são ações que podem acontecer devido a ocorrência de algum evento. A sua execução no projeto foi útil para facilitar o desenvolvimento de algumas regras de negócio, como por exemplo, promover a mudança de itens de uma mochila para outra em uma negociação. Além disso, manteve-se a boa prática de auditoria, como informações sobre ações ocorrendo no banco de dados.

## Transações
As transações são um conjunto de operações para manipular uma série de dados. Sob a orientação de que pode ocorrer algum equívoco na execução de procedimentos no banco de dados, o uso das transações mostrou-se essencial para garantir uma qualidade nos scripts aqui implementados. Como por exemplo, para garantir que um item não seja movido para a mochila de um usuário que não estava envolvido na compra.

## Álgebra Relacional
Álgebra Relacional é uma linguagem de consulta procedural, em que os conjunto ou relações são os envolvidos e desta forma pode-se realizar consultas. Alguns conceitos como união, interseção, exclusividade, diferença e plano cartesiano foram revisados e avaliados para o escopo das regras de negócio.

## Scripts
Os scripts desenvolvidos, podem ser encontrados neste [link](https://github.com/SBD1/Grupo12_Bruvic/tree/main/Modulo%205%20-%20Algebra%20Relacional%2C%20Triggers%2C%20SP%20e%20Transacoes).

#### NOTA: Os scripts gerados neste módulo dependem da execução dos scripts localizados no [Módulo 4](https://github.com/SBD1/Grupo12_Bruvic/tree/main/Modulo%204%20-%20SQL/src/scripts/), logo, recomenda-se a execução destes inicialmente.
