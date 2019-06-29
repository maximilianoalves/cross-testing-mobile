# frozen_string_literal: true
Dado(/^que estou com o app aberto$/) do
  $logger.info('Iniciou o teste')
end

E(/^aceito o tutorial$/) do
  @calculadora = CalculadoraPage.new

  @calculadora.tap_ok_bem_vindo
end

Quando(/^eu adicionar o (.*?)$/) do |primeiro_valor|
  @calculadora.tap_number primeiro_valor
end

E(/^adiciono o sinal de adição$/) do
  @calculadora.tap_plus
end

E(/^adiciono o (.*?)$/) do |segundo_valor|
  @calculadora.tap_number segundo_valor
end

Então(/^devo ter o resultado (.*?)$/) do |resultado|
  @calculadora.tap_equal

  @calculadora.results_are_equal resultado
end