*Settings*
Documentation       Signup test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session


*Test Cases*
Register a new user
    ${user}     Factory User

    Set Suite Variable      ${user}

    Go to Signup Form
    Fill Signup Form    ${user}
    Submit Signup Form
    User Should Be Registered

Duplicate user

    Go to Signup Form
    Fill Signup Form    ${user}
    Submit Signup Form
    Modal Content Should Be     Oops! Já temos um usuário com o e-mail informado.

