# frozen_string_literal: true

class TestePage

  def initialize
    get_screen_mappings 'teste', 'core'
  end

  def accept_alert
    if ios?
      alert_accept
      click @mappings['nome_do_elemento']
    elsif android?
      click @mappings['nome_do_elemento']
    end
    $logger.info('Aceitou um alerta')
  end
end
