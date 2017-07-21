require 'yaml'

current_dir = Dir.getwd
home_dir = Dir.home

puts 'Current directory: ' + current_dir
puts "Type in your destination folder directory path: #{home_dir}"
folder_dir = gets.chomp


Dir.chdir "#{home_dir}/#{folder_dir}"

#This is source directory. Should hardcode this for a common SD Card path
#that is commonly used.

pic_names = Dir['pathname/*.jpg']

puts 'What do you want to call this batch?'
batch_name = gets.chomp

print "Downloading #{batch_name} files."
pic_number = 1

pic_names.each do |name|
  print "."

  new_name = if pic_number < 10
    "#{batch_name}0#{pic_number}.jpg"
  else
    "#{batch_name}#{pic_number}.jpg"
  end
#Do a check here to see if file name already exists
  File.rename name, new_name
  pic_number = pic_number + 1
end
puts "Done, sexy!"


