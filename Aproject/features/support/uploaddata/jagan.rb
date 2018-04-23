require 'spreadsheet'
require 'os'
class Jagan

  def jjjj
    usrCur = Dir.pwd

    $filePath = usrCur.gsub('/','\\')+"\\features\\support\\"
    $contact=$filePath+"\\uploaddata"
    puts $contact
    workbook = Spreadsheet.open "F:\\My jobs\\MessageIt\\Aproject\\features\\support\\uploaddata\\contacts.xls"

# READ

# Specify a single worksheet by index
    sheet1 = workbook.worksheet 0
    puts sheet1.count
    sheet1.each do |row|
      puts row[0]
      puts row[1]
      # puts "#{row[0]} - #{row[1]} - #{row[2]}"
    end
  end
end

#iniya=Jagan.new
#iniya.jjjj