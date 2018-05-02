Given(/^Launch Window$/) do
  page
  visit "/"
  page.driver.browser.manage.window.maximize
  sleep 20
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
if all(:xpath,"(//span[@title='#{$contactno[i]}'])[1]",:visible=>true).count>=1
  step "I click on the contact no/name \"#{$contactno[i]}\""
  step "I enter the text \"#{$message[i]}\" in message area"
  step 'I click on the submit button'
else
  sleep 1
  find(:xpath,"(//button[@class='C28xL'])[1]").click
  puts "No whatsapp for contact : #{$contactno[i]}"
  find(:xpath,"(//button[@class='_1aTxu'])[1]").click
end
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

And(/^I select the first contact and right click on it$/) do
  first(:xpath,"//div[@class='_2wP_Y']").hover
  sleep 2
  first(:xpath,"//div[@class='_2wP_Y']").right_click

end

And(/^I choose "([^"]*)" from the chat right click option$/) do |arg|
  within (find(:xpath,"//div[@class='_2uLFU']")) do
    find(:xpath,"//div[@title='#{arg}']").click
  end
end

And(/^I confirm the delete by clicking the "([^"]*)" button$/) do |arg|
  within (find(:xpath,"//div[@class='_1CnF3']"))do
    find(:xpath,"//div[text()='#{arg}']").click
  end
end


And(/^I Delete the chat untill last message$/) do

  while all(:xpath,"//div[@class='_2wP_Y']",:visible => true).count != 0
  # while first(:xpath,"//div[@class='_2wP_Y']").exists?
    step 'I select the first contact and right click on it'
    step 'I choose "Delete chat" from the chat right click option'
    step 'I confirm the delete by clicking the "Delete" button'

  end

end

Given(/^I attach the image file and send$/) do

  for i in 1..$rowcount-1
    step 'I click on the new chat menu'
    step "I enter the user name \"#{$contactno[i]}\" in search contacts"
    if all(:xpath,"(//span[@title='#{$contactno[i]}'])[1]",:visible=>true).count>=1
      step "I click on the contact no/name \"#{$contactno[i]}\""
      find(:xpath,"//div[@title='Attach']").click
      # find(:xpath,"(//button[@class='GK4Lv'])[1]").click #
      attachmentPath = File.join($notsent,'IOS2.jpeg')
      puts attachmentPath.gsub(/\//, "\\")
      Capybara.ignore_hidden_elements = false
      page.execute_script %Q{
      var element = document.evaluate("(//ul[@class='_3s1D4']/li/input)[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
         element.style = "";element.style.visibility = "visible";element.style.opacity = "1"
      }

      def attach_file_new(locator, path, options={})
        #find(:file_field, locator, options).set(path)
        find(:xpath, locator, options).set(path)
      end
      # attach_file(find(:xpath,"(//button[@class='GK4Lv']/../input)[1]"), attachmentPath.gsub(/\//, "\\"),:visible=>false)
      attach_file_new("(//ul[@class='_3s1D4']/li/input)[1]",attachmentPath.gsub(/\//, "\\"))
      # step 'I click on the submit button'
      step 'I click on the send button for image'
    else
      sleep 1
      find(:xpath,"(//button[@class='C28xL'])[1]").click
      file = Time.now.strftime("%d-%b-%Y_%H%M")
      file1 = "Message_Not_sent_to#{file}.csv"

      @timeconsumed=File.new(File.join($notsent+"/",file1),"a")
      @timeconsumed.write($contactno[i]+"| Message Not sent\n")
      puts "No whatsapp for contact : #{$contactno[i]}"
      find(:xpath,"(//button[@class='_1aTxu'])[1]").click
    end
    i+1
  end
  @timeconsumed.close
end

And(/^I click on the send button for image$/) do
  find(:xpath,"//div[@class='_3hV1n yavlE']").click
end