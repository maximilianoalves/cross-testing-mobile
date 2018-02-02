def button_exists?(button)
  $logger.info("Verificando a existência do botão #{el} usando o tipo de busca XPATH")
  $driver.find_elements(:xpath, button).count > 0
end

def wait_for_button_to_exist(button)
  $logger.info("Aguardou a existência do botão #{el} usando o tipo de busca XPATH")
  $wait.until { button_exists? button }
end

def click_button(button)
  wait_for_button_to_exist button
  $driver.find_element(:xpath, '#{button}').click
  $logger.info("Clicou no botão #{el} usando o tipo de busca XPATH")
end

def wait_for(el)
  case el['tipo_busca']
  when 'XPATH'
    $wait.until { $driver.find_element(:xpath, el['value']).displayed? }
  when 'ID'
    $wait.until { $driver.find_element(:id, el['value']).displayed? }
  when 'CLASS'
    $wait.until { $driver.find_element(:class, el['value']).displayed? }
  end
  $logger.info("Aguardou a exibição do elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
end

def wait_for_element_to_exist(el)
  case el['tipo_busca']
    when 'XPATH'
      $wait.until {element_exists? el['value'], 'XPATH'}
    when 'ID'
      $wait.until {element_exists? el['value'], 'ID'}
    when 'CLASS'
      $wait.until {element_exists? el['value'], 'CLASS'}
  end
  $logger.info("Aguardou a existência do elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
end

def click(el)
  wait_for_element_exist(el)
  case el['tipo_busca']
  when 'XPATH'
    $driver.find_element(:xpath, el['value']).click
  when 'ID'
    $driver.find_element(:id, el['value']).click
  when 'CLASS'
    $driver.find_element(:class, el['value']).click
  end
  $logger.info('Clicou no botão ' + el['value'] + ' usando o tipo de busca ' + el['tipo_busca'])
end

def click_index(el, index)
  wait_for_element_exist(el)
  case el['tipo_busca']
    when 'XPATH'
      $driver.find_elements(:xpath, el['value'])[index].click
    when 'ID'
      $driver.find_elements(:id, el['value'])[index].click
    when 'CLASS'
      $driver.find_elements(:class, el['value'])[index].click
  end

  $logger.info("Clicou no indice #{index} do elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
end

def click_subelement_index(element, el, index)
  wait_for_element_to_exist(el)
  case el['tipo_busca']
  when 'XPATH'
    element.find_elements(:xpath, el['value']).get(index).click
  when 'ID'
    element.find_elements(:id, el['value']).get(index).click
  when 'CLASS'
    element.find_elements(:class, el['value']).get(index).click
  end
  $logger.info("Clicou em um subelemento no indice #{index} do elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
end

def element_exists?(el)
  $logger.info("Verificando se existe o elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
  case el['tipo_busca']
    when 'XPATH'
      return $driver.find_elements(:xpath, el['value']).count > 0
    when 'ID'
      return $driver.find_elements(:id, el['value']).count > 0
    when 'CLASS'
      return $driver.find_elements(:class, el['value']).count > 0
  end
end

def elements(el)
  case el['tipo_busca']
    when 'XPATH'
      return $driver.find_elements(:xpath, el['value'])
    when 'ID'
      return $driver.find_elements(:id, el['value'])
    when 'CLASS'
      return $driver.find_elements(:class, el['value'])
  end
  $logger.info('Buscou a lista de elementos ' + el['value'] + ' usando o tipo de busca ' + el['tipo_busca'])
end

def element_is_enabled?(el)
  $logger.info("Elemento habilitado #{['value']} usando o tipo de busca #{el['tipo_busca']}")
  case el['tipo_busca']
    when 'XPATH'
      return $driver.find_elements(:xpath, el['value']).enabled
    when 'ID'
      return $driver.find_elements(:id, el['value']).enabled
    when 'CLASS'
      return $driver.find_elements(:class, el['value']).enabled
  end
end

def get_text(el)
  $logger.info('Está buscando o texto do elemento ' + el['value'] + ' usando o tipo de busca ' + el['tipo_busca'])
  case el['tipo_busca']
    when 'XPATH'
      return $driver.find_element(:xpath, el['value']).text
    when 'ID'
      return $driver.find_element(:id, el['value']).text
    when 'CLASS'
      return $driver.find_element(:class, el['value']).text
  end
end

def get_subelement_text_index(element, el, index)
  $logger.info("Buscando texto em subelemento no indice #{index} do elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
  case el['tipo_busca']
    when 'XPATH'
      return element.find_elements(:xpath, el['value']).get(index).text
    when 'ID'
      return element.find_elements(:id, el['value']).get(index).text
    when 'CLASS'
      return element.find_elements(:class, el['value']).get(index).text
  end
end

def get_text_index(el, index)
  $logger.info("Indice do texto #{index} do elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
  case el['tipo_busca']
    when 'XPATH'
      return $driver.find_elements(:xpath, el['value']).get(index).text
    when 'ID'
      return $driver.find_elements(:id, el['value']).get(index).text
    when 'CLASS'
      return $driver.find_elements(:class, el['value']).get(index).text
  end
end

def fill_in(el, text)
  case el['tipo_busca']
    when 'XPATH'
      element = $driver.find_element(:xpath, el['value'])
    when 'ID'
      element = $driver.find_element(:id, el['value'])
    when 'CLASS'
      element = $driver.find_element(:class, el['value'])
  end
  element.clear
  element.send_keys text
  $logger.info("Preencheu o campo #{el} usando o tipo de busca #{el['tipo_busca']} com o valor #{text}")
end

def hide_keyboard
  if is_android?
    $driver.hide_keyboard
  elsif is_ios?
    $driver.hide_keyboard :pressKey
  end
  $logger.info('Fechou o teclado virtual')
end

def xpath_exists?(xpath)
  $driver.find_elements(:xpath, xpath).count > 0
end

def wait_for_xpath_to_exist(xpath)
  $wait.until { xpath_exists? xpath }
end

def click_xpath(xpath)
  wait_for_xpath_to_exist xpath
  $driver.find_element(:xpath, xpath).click
end

def id_exists?(id)
  $driver.find_elements(:id, id).count > 0
end

def wait_for_id_to_exist(id)
  $wait.until { id_exists? id }
end

def click_id(id)
  wait_for_id_to_exist id
  $driver.find_element(:id, id).click
end

def tap_screen(screen_x, screen_y)
  Appium::TouchAction.new.tap(x: screen_x, y: screen_y).perform
end

def scrollTo(el_start, el_start_location, el_end, el_end_location)
  if el_start_location == 'ID' && el_end_location == 'ID'
    # get element coordinates start
    el_start = $driver.find_element(:id, el_start)
    screen_x_start = el_start.location.x
    screen_y_start = el_start.location.y
    # get element coordinates end
    el_end = $driver.find_element(:id, el_end)
    screen_x_end = el_end.location.x
    screen_y_end = el_end.location.y
  elsif el_start_location == 'XPATH' && el_end_location == 'XPATH'
    # get element coordinates start
    el_start = $driver.find_element(:xpath, el_start)
    screen_x_start = el_start.location.x
    screen_y_start = el_start.location.y
    # get element coordinates end
    el_end = $driver.find_element(:xpath, el_end)
    screen_x_end = el_end.location.x
    screen_y_end = el_end.location.y
  elsif el_start_location == 'ID' && el_end_location == 'XPATH'
    # get element coordinates start
    el_start = $driver.find_element(:id, el_start)
    screen_x_start = el_start.location.x
    screen_y_start = el_start.location.y
    # get element coordinates end
    el_end = $driver.find_element(:xpath, el_end)
    screen_x_end = el_end.location.x
    screen_y_end = el_end.location.y
  elsif el_start_location == 'XPATH' && el_end_location == 'ID'
    # get element coordinates start
    el_start = $driver.find_element(:xpath, el_start)
    screen_x_start = el_start.location.x
    screen_y_start = el_start.location.y
    # get element coordinates end
    el_end = $driver.find_element(:id, el_end)
    screen_x_end = el_end.location.x
    screen_y_end = el_end.location.y
  end
  Appium::TouchAction.new.swipe(start_x: screen_x_start, start_y: screen_y_start, delta_x: screen_x_end, delta_y: screen_y_end).perform
  $logger.info("Executou o scroll para as coordenadas: screen_x_start #{screen_x_start} - screen_y_start #{screen_y_start} - screen_x_end #{screen_x_end} - screen_y_end #{screen_y_end}")
end

def id_text(id)
  wait_for_id_to_exist id
  $driver.find_element(:id, id).text
end

def text_exists?(text)
  $driver.find_elements(:xpath, "//*[contains(@text,\'#{text}\')]").count > 0
end

def wait_for_text_to_exist(text)
  $wait.until { text_exists? text }
end

def click_text(text)
  wait_for_text_to_exist text
  $driver.find_element(:xpath, "//*[contains(@text,\'#{text}\')]").click
end

def is_android?
  $platform == 'android'
end

def is_ios?
  $platform == 'ios'
end
