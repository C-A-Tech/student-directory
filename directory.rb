def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.delete!("\n")
  while !name.empty? do
    puts "What cohort are they in?"
    month = gets.delete!("\n")
    # set a default month if no cohort entered
    if month == ""
      month = "november"
    end
    puts "Whats their favourite hobby?"
    hobby = gets.delete!("\n")
    # push all inputs into empty array
    students << {name: name, cohort: month.to_sym, hobbies: hobby}
    # conditional statment that prints plural version of the below string if more than 1 student
    if students.count > 1
      puts "Now we have #{students.count} students"
    else 
      puts "Now we have #{students.count} student"
    end
    # reset loop
    puts "Next student?"
    name = gets.delete!("\n")
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(students)
  # set an accumulator so loop can be broken
  total_names = 0
  #use until loop to print studnet details until total numbers matches all total number of students
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
  letter = gets.delete!("\n")
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

def print_grouped_cohort(students)
  puts "Select a cohort"
  cohort = gets.delete!("\n").to_sym
  # only print students who are in the specified cohort
  students.select do |student|
    if student[:cohort] == cohort
      puts "#{student[:name]}--> cohort: #{student[:cohort]}, favourite hobby: #{student[:hobbies]}"
    end
  end
end


students = input_students
print_header
#print_names(students)
#print_names_that_start_with(students)
#print_names_less_than_12_char(students)
print_grouped_cohort(students)
print_footer(students)