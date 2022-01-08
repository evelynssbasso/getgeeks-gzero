*Settings*
Documentation       Login Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   After Test

*Test Cases*
User login
    [Tags]      smoke

    ${user}                  Factory User   login

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    User Should Be Logged In        ${user}


Incorrect Pass
    [Tags]          inv_pass
    ${user}         Create Dictionary       email=evyy.stph@hotmail.com        password=abc123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.


User not found
    [Tags]      user_404

    ${user}     Create Dictionary       email=evy.seph@404.net       password=pwd123


    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.

Incorret Email
    [Tags]     inv_email
    ${user}    Create Dictionary       email=evy.seph.com.br        password=abc123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Should Be Type Email

# Desafio 1 do módulo PRO
Email Required
    [Tags]          desf_pro    req_email
    ${user}         Create Dictionary   email=${empty}       password=abc123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Alert Span Should Be       E-mail obrigatório

Password Required
    [Tags]          desf_pro     req_password
    ${user}         Create Dictionary   email=evelynbasso@hotmail.com   password=${empty} 

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Alert Span Should Be       Senha obrigatória

Submit Login
    [Tags]      desf_pro     sub_login

    @{expected_alerts}      Create List
    ...                     E-mail obrigatório
    ...                     Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be  ${expected_alerts}






# Automatizar 3 novos casos de testes: Email obrigatório, Senha obrigatória, Campos obrigatórios
# Entrega: no Github
