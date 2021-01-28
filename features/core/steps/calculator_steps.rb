# frozen_string_literal: true

Given(/^User see the Calculator$/) do
  $logger.info('Init test')
  @calculator = CalculatorPage.new

  @calculator.calculator_page?
end

And(/^User put first value (\d+)$/) do |number|
  @calculator.fill_field_first_number number

end

And(/^User put second value (\d+)$/) do |number|
  @calculator.fill_field_second_number number
end

When(/^User select "([^"]*)"$/) do |operator|
  @calculator.click_operator operator
end

Then(/^The result should be (\d+)$/) do |result|
  @calculator.assert_equal result
end