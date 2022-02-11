# GravidadeZERO Starter - Desafio
Projeto criado para concluir o desafio das aulas do curso [GravidadeZERO - Starter][QANinja] em Robot Framework.

---

### Pré-Requisitos
- Instalar essas duas bibliotecas no arquivo [base.robot](resources/base.robot)

```
Library  Browser
Library  DateTime
```

- URL utilizada para as aulas: [nBank]

---

### Desafio - Automatizar dois cenários na Webapp nBank

#### Cenario 1: Saldo
Quando acesso a home nBank
Então devo ver meu saldo inicial no valor de R$ 1000

#### Cenario 2: Fazer PIX
- Dado que meu saldo é de R$ 1000
- E acesso a home nBank
- Quando faço um PIX no valor de R$ 100
- Então meu saldo final deve ser de R$ 900
- E a transação em questão é adicionada no meu Extrato

#### Cenario 3: PIX com valor ZERO
- Dado que meu saldo é de R$ 1000
- E acesso a home nBank
- Quando faço um PIX no valor de R$ 0
- Então vejo a mensagem de alerta "Oops. Transferir ZERO é osso hein..."

#### Cenario 4: PIX com valor NEGATIVO
- Dado que meu saldo é de R$ 1000
- E acesso a home nBank
- Quando faço um PIX no valor de R$ -1
- Então vejo a mensagem de alerta "Oops. Valor para PIX incorreto..."

🪲 Atenção: Um dos cenários possui um bug e o mesmo deve ser capturado pelo script de teste automatizado.

---

### Créditos
[<img src="assets\QANinja-Logo-black.png" width="20%"/>][QANinja]


<!-- links -->
[QANinja]: https://qaninja.academy/
[nBank]: https://nbank.vercel.app/

<!-- imagens -->
[QANinja-Logo]: assets/QANinja-Logo-black.png (QANinja-logo)