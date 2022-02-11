*** Settings ***
Documentation       Cenários de teste do PIX no nBank

Library     ${EXECDIR}/resources/factories/transacoes.py

Resource  ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   End Session

*** Test Cases ***
Cenario 1: Saldo
    [Tags]  saldo

    Quando acesso a home nBank
    Entao devo ver meu saldo inicial de R$ "1000"

Cenario 2: Fazer PIX
    [Tags]  happy-pix

    ${transacao}    Factory Happy Pix

    Dado que meu saldo e de R$ "${transacao}[saldo]"
    Quando faco um PIX no valor de R$ "${transacao}"
    Entao meu saldo final deve ser de R$ "${transacao}[saldo_final]"
    E a transacao em questao e adicionada no meu Extrato    ${transacao}

Cenario 3: PIX com valor ZERO
    [Tags]  pix-zero

    ${transacao}    Factory Pix Zero

    Dado que meu saldo e de R$ "${transacao}[saldo]"
    Quando faco um PIX no valor de R$ "${transacao}"
    Entao vejo a mensagem de alerta "${transacao}[mensagem_erro]"

Cenario 4: PIX com valor NEGATIVO
    [Tags]  pix-negativo

    ${transacao}    Factory Pix Negativo

    Dado que meu saldo e de R$ "${transacao}[saldo]"
    Quando faco um PIX no valor de R$ "${transacao}"
    Entao vejo a mensagem de alerta "${transacao}[mensagem_erro]"