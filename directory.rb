@students = [] # an empty array accesable to all methods

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << { :name => name, :cohort => :november }
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp.capitalize
  end
  # return the array of students
  return @students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each { |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" 
  }
end

#finally, we print the total number of students 
def print_footer
  @students.size == 1 ? puts("Overall, we have #{@students.count} great student") : puts("Overall, we have #{@students.count} great students")
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def proccess(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_file
    when "4"
      try_load_students
    when "9"
      exit # this will cause the program to terminate
    else
      "Input error, try again"
  end
end

def save_file
  
  file = File.open("students.csv", "w")
  
  @students.each { |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each { |line| 
    name, cohort = line.chomp.split(',')
    @students << {:name => name, :cohort => cohort.to_sym}
  }
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end

def interactive_menu

  loop do
    print_menu
    proccess(STDIN.gets.chomp)
  end
end

#nothing happens until we call the methods
interactive_menu