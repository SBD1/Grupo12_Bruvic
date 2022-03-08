# Normalização

A Normalização é uma técnica bastante utilizada durante o projeto de Sistemas de Banco de Dados. A Normalização vem com o propósito de solucionar problemas de falta de integridade de modelos de bancos de dados, sejam estes problemas provenientes de inconsistências de inserção, remoção ou atualização.

É válido afirmar que, após serem aplicadas as técnicas de normalização, um modelo de Banco de Dados apresenta uma mais robusta integridade e as tabelas se tornam mais independentes, isto é, cada tabela tem sua responsabilidade bem definida e as tuplas contém somente as informações necessárias a elas mesmas, sem redundâncias ou incoerências.

Vale ressaltar que a Normalização não é uma bala de prata e que, em alguns casos, algumas das Formas Normais podem ser desrespeitadas para que o projeto ganhe eficiência nas operações de consulta ao banco.

## Formas normais e seus propósitos

Todas as 5 formas normais existentes e seus respectivos propósitos podem ser visualizados na tabela abaixo:

| **Forma Normal** | **Propósito**                                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------------------- |
| 1ª Forma Normal  | Esta normalização serve para atomicidade e garantia de monovaloração                                 |
| 2ª Forma Normal  | Esta normalização engloba a 1ª e garante a ausência de dependências parciais                         |
| 3ª Forma Normal  | Esta normalização engloba a 2ª e garante a ausência de dependência transitivas                       |
| Boyce Codd       | Esta normalização garante que todas as chaves de Dependências Funcionais sejam Chaves Candidatas     |
| 4ª Forma Normal  | Esta normalização garante que todas as chaves de Dependências Multivaloradas sejam Chaves Candidatas |

## Modelo Relacional Normalizado

![Mapeamento Relacional](https://github.com/SBD1/Grupo12_Bruvic/blob/d37338b66ec5e65cb7960645a11dd74eacfd0095/Modulo%202%20-%20Modelo%20Relacional/mr_bruvic_v2.png)

> Imagem 1: Modelo Relacional

![Mapeamento Relacional com a 1ª Forma Normal](https://github.com/SBD1/Grupo12_Bruvic/blob/746b03fd9caaacf3f72deb28d12e2342874ff664/Modulo%203%20-%20Normaliza%C3%A7%C3%A3o/mr_bruvic_normalizado_v1.png)

> Imagem 2: Modelo Relacional com a 1ª Forma Normal

![Mapeamento Relacional com a 2ª Forma Normal](https://github.com/SBD1/Grupo12_Bruvic/blob/746b03fd9caaacf3f72deb28d12e2342874ff664/Modulo%203%20-%20Normaliza%C3%A7%C3%A3o/mr_bruvic_normalizado_v2.png)

> Imagem 3: Modelo Relacional com a 2ª Forma Normal

![Mapeamento Relacional Normalizado](https://github.com/SBD1/Grupo12_Bruvic/blob/746b03fd9caaacf3f72deb28d12e2342874ff664/Modulo%203%20-%20Normaliza%C3%A7%C3%A3o/mr_bruvic_normalizado_v3.png)

> Imagem 4: Modelo Relacional Normalizado
