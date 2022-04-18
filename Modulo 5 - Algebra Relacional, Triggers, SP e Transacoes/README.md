# Módulo 5 - Álgebra Relacional, Triggers, Storage Procedure e Transações

No presente módulo, houve a continuação do desenvolvimento do trabalho do grupo, referentes aos conteúdos ministrados no módulo 5, que são Álgebra Relacional, Triggers, Storage Procedure e Transações, que guiaram a implementação e aperfeiçoamento dos scripts.

## Triggers e Storage Procedure
Os gatilhos, ou triggers são ações que podem acontecer devido a ocorrência de algum evento. A sua execução no projeto foi útil para facilitar o desenvolvimento de algumas regras de negócio, como por exemplo, promover a mudança de itens de uma mochila para outra em uma negociação. Além disso, manteve-se a boa prática de auditoria, como informações sobre ações ocorrendo no banco de dados.

## Transações
As transações são um conjunto de operações para manipular uma série de dados. Sob a orientação de que pode ocorrer algum equívoco na execução de procedimentos no banco de dados, o uso das transações mostrou-se essencial para garantir uma qualidade nos scripts aqui implementados. Como por exemplo, para garantir que um item não seja movido para a mochila de um usuário que não estava envolvido na compra.

## Álgebra Relacional


NOTA: Os scripts gerados neste módulo dependem da execução dos scripts localizados no [Módulo 4](https://github.com/SBD1/Grupo12_Bruvic/tree/main/Modulo%204%20-%20SQL/src/scripts/), logo, recomenda-se a execução destes inicialmente.
