require 'capybara'

Capybara.default_max_wait_time = 15

RSpec.configure do |config|
  config.before(:each, js: true) do
    Capybara.reset_sessions!
  end
end
