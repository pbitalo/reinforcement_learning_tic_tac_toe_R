# Reinforcement learning Tic Tac Toe em R

### Tema: Aprendizagem por Reforço

## Objetivo
Criar um app utilizando R, para jogar Tic Tac Toe contra IA.

### Breve descrição
O agente de software irá utilizar em suas ações um algoritmo definido por políticas criadas através de um modelo gerado com o método de aprendizado por reforço. Será utilizado nesse app o pacote ReinforcementLearning, que possui jogadas aleatórias já computadas que irá ajudar no desenvolvimento.

#### Resumo sobre a utilização dos dados.

Basicamente, temos 4 variváveis, são elas: 

##### 1 - Estado atual.
##### 2 - Ação.
##### 3 - Próximo estado.
##### 4 - Recompensa.

#### Exemplo

![Alt text](https://github.com/pbitalo/reinforcement_learning_tic_tac_toe_R/blob/master/exemplo_jogada_teorica.png?raw=true)

A recompensa define qual o sucesso obtido através da jogada executada.

#### Para esse exemplo, temos dois scripts, um para gerar o modelo e outro executar o jogo.

##### Modelo.R
##### TicTacToe.R

### Para executar:
#### 1 - Carregue o Modelo.R
#### 2 - Carregue o TicTacToe.R
#### 3 - Digite no console: "tictactoe(0)" para iniciar a partida.
#### 3.1 - Digite no console o intervalo: "tictactoe(1-9)" para jogar em alguma posição existente.

### Imagem do jogo em execução (exemplo onde o agente ganha a partida)
![Alt text](https://github.com/pbitalo/reinforcement_learning_tic_tac_toe_R/blob/master/PartidaTicTacToeExemplo1.png?raw=true)
