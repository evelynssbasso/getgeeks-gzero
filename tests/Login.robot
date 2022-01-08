*Settings*
Documentation       Login Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
User login

    ${user}                  Factory User Login

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    User Should Be Logged In        ${user}


Incorrect Pass
    [Tags]      i_pass

    ${user}     Create Dictionary       email=evelynbasso@hotmail.com       password=pwd123


    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.


User not found
    [Tags]      user_404

    ${user}     Create Dictionary       email=papito@404.net       password=pwd123


    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.
