# frozen_string_literal: true

require 'rspec/expectations'


class CalculadoraPage
  include RSpec::Matchers


  def initialize
    get_screen_mappings 'calculadora', 'core'
  end

  def tap_ok_bem_vindo
    $logger.info('Clicou no botão OK, dentro da modal de bem-vindo')
    click @mappings['btn_ok_bem_vindo']
  end

  def tap_number(number)
    case number.to_i
    when 1
      click @mappings['btn_one']
    when 2
      click @mappings['btn_two']
    when 3
      click @mappings['btn_three']
    when 4
      click @mappings['btn_four']
    when 5
      click @mappings['btn_five']
    when 6
      click @mappings['btn_six']
    when 7
      click @mappings['btn_seven']
    when 8
      click @mappings['btn_eight']
    when 9
      click @mappings['btn_nine']
    when 0
      click @mappings['btn_zero']
    end
  end

  def refresh
    refresh_screen
  end

  def tap_plus
    click @mappings['btn_plus']
  end

  def tap_equal
    click @mappings['btn_equal']
  end

  def get_result
    return get_text @mappings['result']
  end

  def results_are_equal(result)
    expect(result).to eql(get_result)
  end

end
