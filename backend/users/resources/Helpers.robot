*Settings*
Documentation       Helpers

*Keywords* 
Remove User
    [Arguments] ${user}

    #Obtendo o token
    ${payload}      Creat Dictionary    email=${user}[email]    password=${user}[password]
    ${response}     POST Session  ${payload}

    IF  "200" in "${response}"
        ${token}        Set Varieble    Bearer ${response.json()}[token]
        #Delete na rota /users
        DELETE User     ${token}
    END