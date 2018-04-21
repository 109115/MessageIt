Given(/^Launch Window$/) do
  page
  visit "/"
  page.driver.browser.manage.window.maximize
  sleep 15
=begin
  if page.has_css? "//img[@alt='Scan me!']"
for i in 1..20
  sleep 2
  if page.should have_no_selector(:xpath, "//img[@alt='Scan me!']")
  break
  end
  i+1
end
have not xpath
=end

end

And(/^I enter the name or mobile no in the search field$/) do
  # find(:xpath,"//input[@title='Search or start new chat']").click
  sleep 5
  find(:xpath,"//input[@title='Search or start new chat']").set 'Bala V7'
  # fill_in "Search or start new chat", with: 'Bala V7'

sleep 5
end

And(/^I click on the contact no\/name$/) do
  pending
end

And(/^I enter the text in message$/) do
  pending
end

And(/^I click on the submit button$/) do
  pending
end