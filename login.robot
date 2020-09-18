***Settings***
Documentation       Removendo os Warning do ChromeDriver

Library         SeleniumLibrary

# Gancho
Suite Setup     Open Session
# é do Selenium
Suite Teardown  Close Browser 

***Test Cases***
Login Feliz
    Login With  stark  jarvis!
    Wait Until Page Contains    Olá, Tony Stark. Você acessou a área logada!

Senha inválida
    Login With  stark  abc123
    Wait Until Page Contains    Senha é invalida!

Usuário não existe
    Login With  papito  jarvis!
    Wait Until Page Contains    O usuário informado não está cadastrado!

***Keywords***
# Gancho
Open Session
    Open Browser    about:blank        chrome       #options=add_experimental_option('excludeSwitches', ['enable-logging'])

# Encapsulamento
Login With
    [Arguments]     ${username}     ${pass}

        Go To   https://training-wheels-protocol.herokuapp.com/login

        Input Text   id:userId      ${username}
        Input Text   id:passId      ${pass}

        Click Element   class:btn-login