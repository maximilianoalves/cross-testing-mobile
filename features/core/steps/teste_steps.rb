# frozen_string_literal: true

Dado(/^que tenho alguma ação$/) do
  @teste = TestePage.new
  @acesso.accept_alert
  $logger.info('Realiza alguma ação')
end

E(/^realizado outra ação$/) do
  $logger.info('Realiza alguma outra ação')
end

Quando(/^eu receber este valor (.*?)$/) do |primeiro_titulo_da_tabela|
  $logger.info("Recebeu a variável: #{primeiro_titulo_da_tabela}")
end

E(/^verificar que este valor existe (.*?)$/) do |segundo_titulo_da_tabela|
  $logger.info("Recebeu a variável: #{segundo_titulo_da_tabela}")
end

Entao(/^devo comparar a saida do teste$/) do
  $logger.info('Validação do teste')
end
