def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "What cohort are they in?"
    month = gets.chomp
    # set a default month if no cohort entered
    if month == ""
      month = "november"
    end
    puts "Whats their favourite hobby?"
    hobby = gets.chomp
    students << {name: name, cohort: month.to_sym, hobbies: hobby}
    puts "Now we have #{students.count} students"
    puts "Next?"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(students)
  total_names = 0
  until total_names == students.count
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]}--> cohort: #{student[:cohort]}, favourite hobby: #{student[:hobbies]}".center(100)
      total_names += 1
    end
  end
end

def print_footer(students)
  print "Overall, we have #{students.count} great students"
end

def print_names_that_start_with(students)
  puts "What letter would you like to search for?"
  letter = gets.chomp
  students.each do |student|
    if student[:name][0] == letter
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_names_less_than_12_char(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
students = input_students
print_header
print_names(students)
#print_names_that_start_with(students)
#print_names_less_than_12_char(students)
print_footer(students)