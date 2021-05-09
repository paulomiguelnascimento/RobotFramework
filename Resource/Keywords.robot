*** Settings ***
Library         SeleniumLibrary
Library           FakerLibrary
Variables       ../PageObjects/localizadores.py

*** Variables ***
${Browser}                      Chrome
${Url}                          http://automationpractice.com/index.php
${EMAIL}                        paulo.info13@gmail.com
${pwd}                          julia123
${CAMPO_REFERENCIA_PEDIDO}      TESTE INCLUSAO TEXTO
${FILE}                         C:\\apk\\teste.txt
${texto_mensagem}               teste ph miguel testando a pagina contato



*** Keywords ***
Acessar Página Principal
    Open Browser    ${Url}   ${Browser}
    Maximize Browser Window

Clicar no botão SignIn
    Wait Until Element Is Visible   ${btn_signIn}   10 
    click element  ${btn_signIn}

Verificar com Successo o Clique do Entrar
    title should be  Login - My Store


Entrar Endereco Email Válido
     Wait Until Element Is Visible     ${txt_endereco_email}     10 
     Input Text                        ${txt_endereco_email}     ${EMAIL}

Entrar Senha Válida
    Wait Until Element Is Visible     ${txt_senha}       10 
    Input Text                        ${txt_senha}       ${pwd}    


Entrar Endereco_Email Inválido
    ${EMAILFAKE}=          FakerLibrary.Email  
    Wait Until Element Is Visible     ${txt_endereco_email}       10    
    Input Text                        ${txt_endereco_email}       ${EMAILFAKE}

Entrar Senha Inválida
    ${SENHAFAKE}=                FakerLibrary.Password
    Wait Until Element Is Visible     ${txt_senha}        10  
    Input Text                        ${txt_senha}                ${SENHAFAKE} 

Click Botão Entrar
    Wait Until Element Is Visible      ${btn_entrar}    10 
    click button                      ${btn_entrar}

Verificar com Sucesso o Login
    title should be  My account - My Store

Verificar erro no login
    Page Should Contain   	Authentication failed


Clicar no Botão Contact Us
    Wait Until Element Is Visible     ${btn_contato}         10  
    click element                     ${btn_contato} 

Selecionar Titulo do Assunto
    click element                      ${titulo_assunto}
    Select From List By Label          ${titulo_assunto}        Customer service

Informar Endereco de Email
       ${EMAILFAKE}=          FakerLibrary.Email  
       Wait Until Element Is Visible      ${email_contato}     10    
       Input Text                         ${email_contato}     ${EMAILFAKE}

Informar Referencia do Pedido
    Wait Until Element Is Visible      ${referencia_pedido}     10   
    Input Text                         ${referencia_pedido}     ${CAMPO_REFERENCIA_PEDIDO} 

Clicar e Anexar Arquivo
    Wait Until Element Is Visible     ${btn_escolher_arquivo}    10 
    Choose File                       ${upload_arquivo}          ${FILE}
    Wait Until Element Is Visible     ${campo_mensagem}          10   
    Input Text                        ${campo_mensagem}          ${texto_mensagem}
    Wait Until Element Is Visible     ${btn_enviar}              10  
    Click Element                     ${btn_enviar}
    Page Should Contain Element       ${Mensagem_Sucesso}

Pesquisar Produto
    Wait Until Element Is Visible       ${procurar}             10
    Input Text                          ${procurar}             Vestido
    Click Element                       ${cliquelupa}
    Wait Until Element Is Visible       ${mais_vendidos}         10
    Element Should Be Visible   	    ${mais_vendidos} 

Clicar no Produto
    Click Element                      ${produto_escolhido}
    Page Should Contain   	           Printed Chiffon Dress
    Sleep  2s

Adicionar Produto
    Click Element                      ${adicionar_produto}

Adicionar no Carinho
    Scroll Element Into View           ${carrinho}
    Click Element                      ${carrinho}

Fazer Checkout
    Page Should Contain   	           Product successfully added to your shopping cart
    Wait Until Element Is Visible      ${fazerCheckout}
    Click Element                      ${fazerCheckout}

Validar Resumo da Compra   
    Page Should Contain   	        Shopping-cart summary
    Page Should Contain   	        Your shopping cart contains:
	Page Should Contain   	        2 Product
    Scroll Element Into View        ${AdicionarMaisUmProduto}
    Click Element                   ${AdicionarMaisUmProduto}
    Wait Until Page Contains    	3 Products
    Page Should Contain   	        In stock
    Page Should Contain   	        $51.20
    Scroll Element Into View        ${AdicionarMaisUmProduto}
    Click element                   ${fazerCheckoutCompra}

Acessar Conta
    Wait Until Element Is Visible     ${txt_endereco_email}     10 
    Input Text                        ${txt_endereco_email}     ${EMAIL}
    Wait Until Element Is Visible     ${txt_senha}              10 
    Input Text                        ${txt_senha}              ${pwd}
    Wait Until Element Is Visible      ${btn_entrar}            10 
    click button                      ${btn_entrar}

Incluir Comentario
    Page Should Contain   	Your delivery address
	Page Should Contain   	Your billing address
    Input text              ${comentario}       teste inclusao de compra no carrinho de compra
    Click element           ${RealizarCheckout}

Validar Envio
    Wait Until Page Contains Element   	    ${ValidarEnvio}
    Click element           ${CheckBoxEnvio}
    Click Element           ${RealizarCheckoutEnvio}

Escolha Forma de pagamento
    Page Should Contain   	Please choose your payment method
    Click element           ${FormaPagamento}

Confirma Forma de Pagamento
    Page Should Contain   	Order summary
    Page Should Contain   	Bank-wire payment.
    Click element           ${ConfirmarPagamento}
    Page Should Contain   	Your order on My Store is complete.


Fechar Navegador
  Close Browser