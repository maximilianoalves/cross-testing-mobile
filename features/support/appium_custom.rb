# frozen_string_literal: true

def element_displayed?(el)
  case el['type']
  when 'XPATH'
    $wait.until { $driver.find_element(:xpath, el['value']).displayed? }
  when 'ID'
    $wait.until { $driver.find_element(:id, el['value']).displayed? }
  when 'CLASS'
    $wait.until { $driver.find_element(:class, el['value']).displayed? }
  when 'TEXT'
    $wait.until { $driver.find_element(:text, el['value']).displayed? }
  else
    raise('element_displayed?: Tipo não implementado ou não encontrado')
  end
  $logger.info("Aguardou a exibição do elemento #{el['value']} usando o tipo de busca #{el['type']}")
end

def click(el)
  wait_for_element_exist(el)
  case el['type']
  when 'XPATH'
    $driver.find_element(:xpath, el['value']).click
  when 'ID'
    $driver.find_element(:id, el['value']).click
  when 'CLASS'
    $driver.find_element(:class, el['value']).click
  when 'ACCESS_ID'
    $driver.find_element(:accessibility_id, el['value']).click
  when 'TEXT'
    $driver.find_element(:text, el['value']).click
  else
    raise('click: Tipo não implementado ou não encontrado')
  end
  $logger.info("Clicou no botão #{el['value']} usando o tipo de busca #{el['type']}")
end

def wait_for_element_exist(el)
  case el['type']
  when 'XPATH'
    $wait.until {element_exists? el}
  when 'ID'
    $wait.until {element_exists? el}
  when 'CLASS'
    $wait.until {element_exists? el}
  when 'ACCESS_ID'
    $wait.until {element_exists? el}
  else
    raise('wait_for_element_exist: Tipo não implementado ou não encontrado')
  end
  $logger.info("Aguardou a existência do elemento #{el['value']} usando o tipo de busca #{el['type']}")
end

def click_by_index(el, index)
  wait_for_element_exist(el)
  case el['type']
  when 'XPATH'
    $driver.find_elements(:xpath, el['value'])[index].click
  when 'ID'
    $driver.find_elements(:id, el['value'])[index].click
  when 'CLASS'
    $driver.find_elements(:class, el['value'])[index].click
  when 'ACCESS_ID'
    $driver.find_elements(:accessibility_id, el['value'])[index].click
  else
    raise('click_by_index: Tipo não implementado ou não encontrado')
  end
  $logger.info("Clicou no indice #{index} do elemento #{el['value']} usando o tipo de busca #{el['type']}")
end

def element_exists?(el)
  $logger.info("Verificando se existe o elemento #{el['value']} usando o tipo de busca #{el['type']}")
  case el['type']
  when 'XPATH'
    return $driver.find_elements(:xpath, el['value']).count > 0
  when 'ID'
    return $driver.find_elements(:id, el['value']).count > 0
  when 'CLASS'
    return $driver.find_elements(:class, el['value']).count > 0
  when 'ACCESS_ID'
    return $driver.find_elements(:accessibility_id, el['value']).count > 0
  else
    raise('element_exists?: Tipo não implementado ou não encontrado')
  end
end

def elements(el)
  $logger.info("Buscou a lista de elementos #{el['value']} usando o tipo de busca #{el['type']}")
  case el['type']
  when 'XPATH'
    return $driver.find_elements(:xpath, el['value'])
  when 'ID'
    return $driver.find_elements(:id, el['value'])
  when 'CLASS'
    return $driver.find_elements(:class, el['value'])
  when 'ACCESS_ID'
    return $driver.find_elements(:accessibility_id, el['value'])
  else
    raise('elements?: Tipo não implementado ou não encontrado')
  end
end

def element_is_enabled?(el)
  $logger.info("Elemento habilitado #{el['value']} usando o tipo de busca #{el['type']}")
  case el['type']
  when 'XPATH'
    return $driver.find_elements(:xpath, el['value']).enabled
  when 'ID'
    return $driver.find_elements(:id, el['value']).enabled
  when 'CLASS'
    return $driver.find_elements(:class, el['value']).enabled
  when 'ACCESS_ID'
    return $driver.find_elements(:accessibility_id, el['value']).enabled
  else
    raise('element_is_enabled?: Tipo não implementado ou não encontrado')
  end
end

def get_text(el)
  $logger.info("Está buscando o texto do elemento #{el['value']} usando o tipo de busca #{el['type']}")
  case el['type']
  when 'XPATH'
    return $driver.find_element(:xpath, el['value']).text
  when 'ID'
    return $driver.find_element(:id, el['value']).text
  when 'CLASS'
    return $driver.find_element(:class, el['value']).text
  when 'ACCESS_ID'
    return $driver.find_element(:accessibility_id, el['value']).text
  else
    raise "get_text: Tipo não implementado ou não encontrado"
  end
end

def get_text_index(el, index)
  $logger.info("Indice do texto #{index} do elemento #{el['value']} usando o tipo de busca #{el['type']}")
  case el['type']
  when 'XPATH'
    return $driver.find_elements(:xpath, el['value']).get(index).text
  when 'ID'
    return $driver.find_elements(:id, el['value']).get(index).text
  when 'CLASS'
    return $driver.find_elements(:class, el['value']).get(index).text
  when 'ACCESS_ID'
    return $driver.find_elements(:accessibility_id, el['value']).get(index).text
  else
    raise "get_text_index: Tipo não implementado ou não encontrado"
  end
end

def fill_in(el, text)
  case el['type']
  when 'XPATH'
    element = $driver.find_element(:xpath, el['value'])
    clean_text(el)
    element.send_keys text
  when 'ID'
    element = $driver.find_element(:id, el['value'])
    clean_text(el)
    element.send_keys text
  when 'CLASS'
    element = $driver.find_element(:class, el['value'])
    clean_text(el)
    element.send_keys text
  when 'ACCESS_ID'
    element = $driver.find_element(:accessibility_id, el['value'])
    clean_text(el)
    element.send_keys text
  end
  $logger.info("Preencheu o campo #{el} usando o tipo de busca #{el['type']} com o valor #{text}")
end

def tap_screen(screen_x, screen_y)
  Appium::TouchAction.new.tap(x: screen_x, y: screen_y).perform
end

def clean_text(el)
  if el.text.size > 0
    el.clear
  end
end

def android?
  $platform == 'android'
end

def ios?
  $platform == 'ios'
end

def hide_keyboard
  if android?
    $driver.hide_keyboard
  elsif ios?
    $driver.hide_keyboard :pressKey
  end
  $logger.info('Fechou o teclado virtual')
end

def refresh_screen
  $driver.refresh
end
