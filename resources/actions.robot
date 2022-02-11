*** Settings ***
Documentation       Ações customizadas do nBank

*** Keywords ***
Quando acesso a home nBank
    Go To   ${BASE_URL}
    Wait For Elements State     css=.carousel-items     visible     5

Entao devo ver meu saldo inicial de R$ "${saldo}"

    ${element}      Set Variable    css=.navbar-end a.navbar-item

    Wait For Elements State     ${element}      visible     5
    Get Text                    ${element}      contains    ${saldo}

Dado que meu saldo e de R$ "${saldo}"
    Run Keyword  Entao devo ver meu saldo inicial de R$ "${saldo}"

Quando faco um PIX no valor de R$ "${transacao}"
    Click   text=Fazer PIX

    # Checkpoint pro Modal aparecer
    Wait For Elements State     css=.modal-card-body img    visible     5

    # Preencher Modal
    Select Options By           css=span.select select         text       ${transacao}[banco]
    Fill Text                   id=chave-pix                   ${transacao}[chave_pix]
    Fill Text                   id=valor                       ${transacao}[pix]
    Click                       text=Enviar PIX

Entao meu saldo final deve ser de R$ "${saldo-final}"
    Run Keyword  Entao devo ver meu saldo inicial de R$ "${saldo-final}"

E a transacao em questao e adicionada no meu Extrato
    [Arguments]     ${transacao}

    ${date}         Get Current Date    result_format=%d/%m/%Y
    ${pix}          Convert To String       ${transacao}[pix]

    ${element}      Set Variable    xpath=//td[contains(text(), "Envio de PIX")]/..

    Wait For Elements State         ${element}      visible     5
    Get Text        ${element}      contains        ${transacao}[banco]
    Get Text        ${element}      contains        ${date}
    Get Text        ${element}      contains        ${pix}

Entao vejo a mensagem de alerta "${mensagem_esperada}"
    ${element}      Set Variable    css=div.media-content

    Wait For Elements State         ${element}      visible     5
    Get Text        ${element}      equal        ${mensagem_esperada}