*Settings*
Documentation       BeeGeek Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
Be a Geek
    ${user}     Factory User    be_geek

    Do Login  ${user}

    Go To Geek Form
    Fill Geek Form      ${user}[geek_profile]
    Submit Geek Form
    Geek Form Should Be Success

Short Description

    ${user}     Factory User        short_desc
    Do Login  ${user}

    Go To Geek Form
    Fill Geek Form      ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be    A descrição deve ter no minimo 80 caracteres

Long Description
    [Tags]      long_desc

    ${user}     Factory User        long_desc
    Do Login    ${user}

    Go To Geek Form
    Fill Geek Form      ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be    A descrição deve ter no máximo 255 caracteres

# Desafio final do módulo PRO

Validation Field Whatsapp Desc and Cost
    [Tags]          desf_pro2
    [Setup]         Start Session Whatsapp-Desc-Cost
    [Template]      Validation Filds Whatsapp Desc and Cost

    whatsapp        ${EMPTY}        O Whatsapp deve ter 11 digitos contando com o DDD
    whatsapp        19              O Whatsapp deve ter 11 digitos contando com o DDD
    whatsapp        1998745555      O Whatsapp deve ter 11 digitos contando com o DDD
    desc            ${EMPTY}        Informe a descrição do seu trabalho
    cost            ${EMPTY}        Valor hora deve ser numérico
    cost            123qwef         Valor hora deve ser numérico
    cost            vcfryh          Valor hora deve ser numérico
    cost            ¨&*#@!          Valor hora deve ser numérico

*Keywords*
Start Session Whatsapp-Desc-Cost
    Start Session
    ${user}     Factory User    req_fields
    Do Login    ${user}

Validation Filds Whatsapp Desc and Cost
    [Arguments]     ${valid_fild_1}        ${valid_fild_2}     ${alert}

    Go To Geek Form
    Fill Text       id=${valid_fild_1}     ${valid_fild_2}
    Submit Geek Form
    Alert Span Should Be        ${alert}          
    Return To Profile Page
   
# 1 - Whatsapp em branco
# 2 - Whatsapp somente DDD
# 3 - Whatsapp com 10 digitos
# 4 - Descrição em branco
# 5 - Valor hora em branco
# 6 - Valor hora com alphanuméricos
# 7 - Valor hora com letras
# 8 - Valor hora com caracteres especiais

# Dica 1: Use o modelo de template de teste
# Dica 2: O login ficará melhor se for executa um única vez para todos os compotamentos.

