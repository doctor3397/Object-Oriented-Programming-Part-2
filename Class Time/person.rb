# Both the instructor and the student have names. We know that instructors and students are both people. Create a parent Person class that contains the attribute name and an initializer to set the name.
class Person

  attr_reader :name

  def initialize(name)
    @name = name
  end

  # Both the instructor and the student should also be able to do a greeting, like "Hi, my name is #{name}". Where's the best place to put this common method?
  def greetings
    "Hi, my name is #{name}"
  end
end


class Student < Person
  # The student class has a method called learn that outputs "I get it!".
  def learn
    "I get it!"
  end
end

class Instructor < Person
  # The instructor class has a method called teach that outputs "Everything in Ruby is an Object".
  def teach
    "Everything in Ruby is an Object"
  end
end

# Create an instance of Instructor whose name is "Chris" and call his greeting.
chris = Instructor.new("Chris")
p chris.greetings

# Create an instance of Student whose name is "Cristina" and call her greeting.
christina = Student.new("Christina")
p christina.greetings

# Call the teach method on your instructor instance and call the learn method on your student.
p chris.teach
p christina.learn

# Next, call the teach method on your student instance. What happens? Why doesn't that work? Leave a comment in your program explaining why.

# p chris.learn ==> undefined method `learn' for #<Instructor:0x005599eaaa66b0 @name="Chris"> (NoMethodError)
# p christina.teach ==> undefined method `teach' for #<Student:0x005584c7b9a4c8 @name="Christina"> (NoMethodError)
