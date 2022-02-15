#let's put all the students into an array
def input_students(students)
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  #students = []
  # get the first name
  name = gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << { :name => name, :cohort => :november }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return the array of students
  return students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each { |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" 
  }
end

#finally, we print the total number of students 
def print_footer(names)
  names.size == 1 ? puts("Overall, we have #{names.count} great student") : puts("Overall, we have #{names.count} great students")
end

def interactive_menu
  students = []
  # step 4. back to step 1, print the menu
  loop do
    # step 1. print menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # step 2. ask what the user wants to do
    selection = gets.chomp
    # step 3. de what the user has asked 
    case selection
    when "1"
      students = input_students(students)
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      "Input error, try again"
    end
  end
end
#nothing happens until we call the methods
interactive_menu