#Methods and class
class Course
  attr_accessor :name, :beginning, :ending
  def initialize(name, beginning, ending)
    @name = name
    @beginning = Date.parse(beginning)
    @ending = Date.parse(ending)
  end
end

def readandcreate
  file = File.open('courses.txt', 'r')
  data = file.readlines
  file.close

  @courses = []
  data.each do |line|
    ls = line.split(', ')
    @courses << Course.new(*ls)
  end
end

def courses_before(courses, filter_date)
  filter_date = Date.parse(filter_date)
  if filter_date >= Date.parse("2018-01-01")
    puts "The date entered es greater than 2018-01-01"
  else
    courses_starting_before = []
    courses.each do |course|
      courses_starting_before << course if course.beginning < filter_date
    end
    courses_starting_before.each do |course|
      puts "#{course.name} course starts before #{filter_date} "
    end
  end
end

def courses_after(courses, filter_date)
  filter_date = Date.parse(filter_date)
  if filter_date >= Date.parse("2018-01-01")
    puts "The date entered es greater than 2018-01-01"
  else
    courses_ending_after = []
    courses.each do |course|
      courses_ending_after << course if course.ending < filter_date
    end
    courses_ending_after.each do |course|
      puts "#{course.name} course ends after #{filter_date} "
    end
  end
end



#Programa
require 'date'
readandcreate()
courses_before(@courses,"2017-05-01")
courses_after(@courses, "2017-11-01")
