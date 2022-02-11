def factory_happy_pix():
    saldo = 1000
    pix = 100
    saldo_final = saldo - pix
    transacao = {
        'saldo': saldo,
        'pix': pix,
        'saldo_final': saldo_final,
        'banco': 'Nubank',
        'chave_pix': 'teste'
    }
    return transacao


def factory_pix_zero():
    saldo = 1000
    pix = 0
    transacao = {
        'saldo': saldo,
        'pix': pix,
        'mensagem_erro': 'Oops. Transferir ZERO é osso hein...',
        'banco': 'Nubank',
        'chave_pix': 'teste'
    }
    return transacao


def factory_pix_negativo():
    saldo = 1000
    pix = -1
    transacao = {
        'saldo': saldo,
        'pix': pix,
        'mensagem_erro': 'Oops. Valor para PIX incorreto...',
        'banco': 'Nubank',
        'chave_pix': 'teste'
    }
    return transacao
