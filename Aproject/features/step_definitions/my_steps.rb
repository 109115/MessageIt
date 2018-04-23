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
sleep 2
  find(:xpath,"(//span[@title='#{$contactno}'])[1]").click
end

And(/^I enter the text in message$/) do
  sleep 3
  # find(:xpath,"//div[text()='Type a message']/..").set 'Trial message'
  find(:xpath,"//div[@class='_2S1VP copyable-text selectable-text']").set @message
end

And(/^I click on the submit button$/) do
  find(:xpath,"//span[@data-icon='send']").click
end

And(/^I click on the new chat menu$/) do
  find(:xpath,"//div[@title='New chat']").click
end

And(/^I enter the user name in contacts$/) do
  find(:xpath,"//input[@title='Search contacts']").set @contactno
end

And(/^I send message to rest of the contact$/) do

    for i in 1..$rowcount-1
step 'I click on the new chat menu'
step "I enter the user name \"#{$contactno[i]}\" in search contacts"
step "I click on the contact no/name \"#{$contactno[i]}\""
step "I enter the text \"#{$message[i]}\" in message area"
step 'I click on the submit button'
      i+1
    end
  end


And(/^I enter the user name "([^"]*)" in search contacts$/) do |arg|
  find(:xpath,"//input[@title='Search contacts']").set arg
end

And(/^I click on the contact no\/name "([^"]*)"$/) do |arg|
  sleep 2
  find(:xpath,"(//span[@title='#{arg}'])[1]").click
end

And(/^I enter the text "([^"]*)" in message area$/) do |arg|
  find(:xpath,"//div[@class='_2S1VP copyable-text selectable-text']").set arg
end