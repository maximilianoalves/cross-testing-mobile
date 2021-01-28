# frozen_string_literal: true

require 'rspec/expectations'

class CalculatorPage
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'calculator', 'core'
  end

  def get_result
    return get_text @mappings['txt_view_result']
  end

  def fill_field_first_number number
    fill_in @mappings['field_first_number'],number
  end

  def fill_field_second_number number
    fill_in @mappings['field_second_number'],number
  end

  def click_btn_sum
    click @mappings['btn_sum']
  end

  def click_btn_subtract
    click @mappings['btn_subtract']
  end

  def click_btn_multiply
    click @mappings['btn_multiply']
  end

  def click_btn_divide
    click @mappings['btn_divide']
  end

  def calculator_page?
    wait_for_element_exist @mappings['txt_view_result']
  end

  def click_operator operator
    case operator
    when 'sum'
      click_btn_sum
    when 'subtract'
      click_btn_subtract
    when 'multiply'
      click_btn_multiply
    when 'divide'
      click_btn_divide
    end
  end

  def assert_equal(result)
    puts "get_result: " + get_result.to_i
    expect(result.to_i).to eq(get_result.to_i)
  end

end
