#let's put all the students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Wich of the West",
  "Terminator",
  "Freaddy Kruger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# and then we print them
puts "The students of Villains Academy"
puts "-------------"
students.each { |student|
  puts student 
  
}
#finally, we print the total number of students 
print "Overall, we have #{students.count} great students\n"