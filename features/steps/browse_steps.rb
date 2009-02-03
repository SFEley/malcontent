# Add your steps here
#
# A few examples:
#
# Given %r{^I was registered with ([^/\s]+)/(\S+)}i do |email, password|
#   @current_person = Person.generate(:email => email, :password => password))
# end
#
# Given %r{^I am authenticated as ([^/\s]+)/(\S+)}i do |email, password|
#   Given %{I was registered with #{email}/#{password}}
#   Then %{I can log in as #{email}/#{password}}  
# end
#
# Then %r{^I can log in as ([^/\s]+)/(\S+)}i do |email, password|
#   When %{I try to log in as #{email}/#{password}}
#   Then %{I should be redirected to /dashboard}
# end
#
# Then %r{^I can not log in as ([^/\s]+)/(\S+)}i do |email, password|
#   When %{I try to log in as #{email}/#{password}}
#   Then %{I should be redirected to /sessions}
#   And %{I should see "Wrong e-mail or password!"}
# end

Before do
  Content.all.destroy!
  @contents = {}
end

Given /^content at "(.*)"$/ do |name|
  @contents[name] = Content.make(:linkname => name)
end

Given /^content titled "(.*)"$/ do |title|
  @content = Content.make(:title => title)
  @contents[@content.name] = @content
end

Given "no content" do
  # This is a no-op.
end

Then /I should see the "(.*)" content/ do |name|
  Then %{I should see "#{@contents[linkname].body}"}
end

Then /I should see "(.*)" listed/ do |name|
  response.should have_xpath("//*[@id='contents']/*[@class='content' and descendant-or-self::*[contains(text(),'#{linkname}')]]")
end


