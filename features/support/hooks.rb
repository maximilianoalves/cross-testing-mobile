# frozen_string_literal: true

Before do
  $driver.start_driver
end

After do
  $driver.driver_quit
  $logger.info('Teste finalizado')
end
