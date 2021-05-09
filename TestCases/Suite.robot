*** Settings ***
Library         SeleniumLibrary
Library           FakerLibrary
Resource        ../Resource/Keywords.robot

Test Setup         Acessar Página Principal
Test Teardown      Fechar Navegador

*** Test Cases ***
CT001 - Login Realizado Com Sucesso
  Clicar no botão SignIn
  Verificar com Successo o Clique do Entrar
  Entrar Endereco Email Válido 
  Entrar Senha Válida           
  Click Botão Entrar
  Verificar com Sucesso o Login
   
CT002 - Login Invalido
  Clicar no botão SignIn
  Verificar com Successo o Clique do Entrar
  Entrar Endereco_Email Inválido   
  Entrar Senha Inválida             
  Click Botão Entrar
  Verificar erro no login
    
CT003 - Validar Contato
  Clicar no Botão Contact Us
  Selecionar Titulo do Assunto
  Informar Endereco de Email
  Informar Referencia do Pedido
  Clicar e Anexar Arquivo

CT004 - Adicionar Produto ao Carrinho
  Pesquisar Produto
  Clicar no Produto
  Adicionar Produto
  Adicionar no Carinho
  Fazer Checkout
  Validar Resumo da Compra
  Acessar Conta
  Incluir Comentario
  Validar Envio
  Escolha Forma de pagamento
  Confirma Forma de Pagamento

