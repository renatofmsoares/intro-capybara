Before do |scenario|
  Capybara.reset_sessions!
  @tools = Tools.new
  @scenario_name = "#{scenario.feature.name}"
end

After do |scenario|
  if scenario.failed?
    # @tools.printscreenFailed(@scenario_name)
  end
  Capybara.reset_sessions!
end