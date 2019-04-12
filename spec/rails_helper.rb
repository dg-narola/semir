# This file is copied to spec/ when you run 'rails generate rspec:install'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

# Add additional requires below this line. Rails is not loaded until this point!
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'database_cleaner'
require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'shoulda/matchers'


selenium_url = "http://localhost:3002/wd/hub"

#use :chrome instead of :selenium_remote
Capybara.register_driver :selenium_remote do |app|
  options = ::Selenium::WebDriver::Chrome.driver_path::Options.new

  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1400,1400')

  Capybara::Selenium::Driver.new(app,
      { url: selenium_url, browser: :chrome, options: options })
end

Capybara.server = :webrick #puma
Capybara.javascript_driver = :selenium_remote #:chrome


# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/shared/**/*.rb")].each { |f| require f }


# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"
  #
  # # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # # examples within a transaction, remove the following line or assign false
  # # instead of true.
  # config.use_transactional_fixtures = true

  # config.include Mongoid::Matchers, type: :model
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.use_transactional_fixtures = true
  # config.include OmniAuthTestHelper, type: :controller


  # This block configures Caypbara's driver to use Selenium
    # It makes it use the chrome browser, but can also be configured to user Firefox, etc.
    Capybara.register_driver :selenium do |app|
         Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    # Uncomment to use capybara-webkit driver for headless testing
    # Capybara.javascript_driver = :webkit
    # Capybara.run_server = false
    # Capybara.app_host = "https://my-website.mysite.com"
    Capybara.configure do |config|
        config.default_max_wait_time = 10 #seconds
        config.default_driver = :selenium
        # config.always_include_port = true
    end

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
