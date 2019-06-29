#language: pt
#encoding: utf-8

@android @ios @acceptance @wip
Funcionalidade: Realizar calculos diversos

  Esquema do Cenário: Realizar calculos de adição
    Dado que estou com o app aberto
    E aceito o tutorial
    Quando eu adicionar o <primeiro_valor>
    E adiciono o sinal de adição
    E adiciono o <segundo_valor>
    Então devo ter o resultado <resultado>

  Exemplos: Nome da tabela de exemplo
  | primeiro_valor| segundo_valor| resultado |
  |5              | 5            | 10        |