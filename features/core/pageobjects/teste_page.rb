class TestePage

  def initialize
    get_screen_mappings 'teste', 'core'
  end

  def accept_alert
    if is_ios?
      alert_accept
      click @mappings['nome_do_elemento']
    elsif is_android?
      click @mappings['nome_do_elemento']
    end
    $logger.info('Aceitou um alerta')
  end
end