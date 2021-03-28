@students = [] #an empty array that is accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.delete!("\n") # STDIN - means standard input stream - 
        # "gets" function is to read  the list of file supplied as arguments, and only defaults to the input from the keyboard if there are no files
        # in this programme, we need to specify where the input is coming from because we have passed files to the program as an argument
        
  while !name.empty? do
    puts "What cohort are they in?"
    month = STDIN.gets.delete!("\n")
    # set a default month if no cohort entered
    if month == ""
      month = "november"
    end
    puts "Whats their hobby?"
    hobby = STDIN.gets.delete!("\n")
    # push all inputs into empty array
    @students << {name: name, cohort: month.to_sym, hobbies: hobby}
    # conditional statment that prints plural version of the below string if more than 1 student
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else 
      puts "Now we have #{@students.count} student"
    end
    # reset loop
    puts "Next student?"
    name = STDIN.gets.delete!("\n")
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  # set an accumulator so loop can be broken
  total_names = 0
  #use until loop to print studnet details until total numbers matches all total number of students
  until total_names == @students.count
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} --> cohort: #{student[:cohort]}, hobby: #{student[:hobbies]}"
      total_names += 1
    end
  end
end

def print_names_that_start_with
  puts "What letter would you like to search for?"
  letter = STDIN.gets.delete!("\n")
  @students.each do |student|
    if student[:name][0] == letter
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_names_less_than_12_char
  @students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_grouped_cohort
  puts "Select a cohort"
  cohort = STDIN.gets.delete!("\n").to_sym
  # only print students who are in the specified cohort
  @students.select do |student|
    if student[:cohort] == cohort
      puts "#{student[:name]} --> cohort: #{student[:cohort]}, favourite hobby: #{student[:hobbies]}"
    end
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, hobby = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym, hobbies: hobby}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
	
def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  else 
    puts "Overall, we have #{@students.count} great student"
  end
end

def print_menu
  puts "Select one of the following options"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" 
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit 
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
try_load_students
interactive_menu
#print_names
#print_names_that_start_with
#print_names_less_than_12_char
