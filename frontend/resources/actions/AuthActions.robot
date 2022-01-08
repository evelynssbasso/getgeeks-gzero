*Settings*
Documentation       Authentication Actions

*Variables*

${IMPUT_EMAIL}      id=email
${IMPUT_PASS}       id=password

*Keywords*
Go To Login Page
    Go To       ${BASE_URL}

    Wait For Elements State     css=.login-form     visible     5

Fill Credentials
    [Arguments]     ${user}

    Fill Text       id=email        ${user}[email]
    Fill Text       id=password     ${user}[password]

Submit Credentials
    Click           css=.submit-button >> text=Entrar

User SHould Be Logged In
    [Arguments]         ${user}

    ${element}              Set Variable        css=a[href="/profile"]
    ${expect_fullname}      Set Variable        ${user}[name] ${user}[lastname]

    Wait For Elements State     ${element}      visible     5
    Get Text                    ${element}      equal       ${expect_fullname}

Should Be Type Email
    Get Property           ${IMPUT_EMAIL}        type        equal       email
