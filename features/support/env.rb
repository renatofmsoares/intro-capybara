require "cucumber"
require "selenium/webdriver"
require "capybara/dsl"

World Capybara::DSL

desired_capabilites_args = Selenium::WebDriver::Remote::Capabilities.chrome(
  "chromeOptions" => { "args" => %w[window-size=1600,900 disable-gpu no-sandbox] },
)

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 30
end

Capybara.register_driver :selenium_chrome do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 60 #120
  Capybara::Selenium::Driver.new(
    app,
    :browser => :chrome
  )
end
