require "capybara/cucumber"
require "selenium/webdriver"
require 'yaml'
require 'os'
require 'spreadsheet'

$filePath = ""
usrCur = Dir.pwd
if OS.windows?
  if usrCur.include? "Aproject"
    $filePath = usrCur.gsub('/','\\')+"\\features\\support\\"
  else
    $filePath = usrCur.gsub('/','\\')+"\\MessageIt\\Aproject\\features\\support\\"
  end
elsif OS.linux? || OS.mac?
  if usrCur.include? "Aproject"
    $filePath = usrCur.gsub('/','/')+"/features/support/"
  else
    $filePath = usrCur.gsub('/','/')+"/features/support/"
  end
end

$contact=$filePath+"\\uploaddata"

Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium
Capybara.default_max_wait_time = 15
# <----------------------End of Function---------------------->
ENV['brw']||='chrome'

Capybara.app_host= "https://web.whatsapp.com"

Capybara.register_driver :selenium do |app|
  # brw = $cnf['browser_Launch']
  puts "Browser Launched:   "+ ENV['brw']
  brws=ENV['brw']
  case
    when brws == "ie"
      Capybara::Selenium::Driver.new(app,:browser=>:internet_explorer)
    when brws =='firefox'
      Capybara::Selenium::Driver.new(app,:browser=>:firefox)
    when brws == 'chrome'
      Capybara::Selenium::Driver.new(app,:browser=>:chrome,:switches => ['--disable-extensions'])
  end

end

# <----------------------End of Function---------------------->

#Prevents the browser quit

=begin
Selenium::WebDriver::Driver.class_eval do
  def quit
    STDOUT.puts "#{self.class}#Browser will not be Quited!!!"
  end
end
Capybara::Selenium::Driver.class_eval do
  def reset!
  end
end
=end
#<----------------------End of Function---------------------->

#
workbook = Spreadsheet.open "C:\\Users\\109115\\RubymineProjects\\MessageIt\\Aproject\\features\\support\\uploaddata\\contacts.xls"

# READ

# Specify a single worksheet by index
sheet1 = workbook.worksheet 0
sheet1.each do |row|
  puts "#{row[0]} - #{row[1]} - #{row[2]}"
end

=begin
# Specify a single worksheet by name
sheet2 = workbook.worksheet 'Sheet2'
sheet2.each do |row|
  puts "#{row[0]} - #{row[1]} - #{row[2]}"
end
=end
