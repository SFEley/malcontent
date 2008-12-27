Then /^I should see "(.*)"$/ do |text|
  response.body.to_s.should =~ /#{text}/m
end

Then /^I should not see "(.*)"$/ do |text|
  response.body.to_s.should_not =~ /#{text}/m
end

Then /^I should see an? (\w+) message$/ do |message_type|
  response.should have_xpath("//*[@class='#{message_type}']")
end

Then /^the (.*) ?request should fail/ do |_|
  response.should_not be_successful
end

Then /^I should see a "(.*)" link$/ do |text|
  @linktext = text
  response.should have_xpath("//a[text() = '#{@linktext}']")
end

Then /^it should point to the (.*) route$/ do |route|
  @linkroute = url(route.tr(' ', '_').to_sym)
  response.should have_xpath("//a[text() = '#{@linktext}' and @href = '#{@linkroute}']")
end

Then /^it should point to \/(.*)$/ do |route|
  @linkroute = route
  response.should have_xpath("//a[text() = '#{@linktext}' and @href = '#{@linkroute}']")
end

Then /^I should see a (\w+) element$/ do |element|
  response.should have_xpath("//#{element}")
end