class TestePage

  def initialize
    package = "core"
    get_screen_mappings "teste", package
  end

  def accept_alert
    if is_ios?
      alert_accept
      click @mappings["nome_do_elemento"]["value"], @mappings["nome_do_elemento"]["aceitar_termos"]["tipo_de_busca"]
    elsif is_android?
      click @mappings["nome_do_elemento"]["value"], @mappings["nome_do_elemento"]["aceitar_termos"]["tipo_de_busca"]
    end
    $logger.info("Aceitou um alerta")
  end
end