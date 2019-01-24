class Table
  attr_accessor :name, :earnings
  def initialize(name, *earnings)
    @name = name
    @earnings = earnings.map(&:to_i)
  end
end

def bigearningtables(tables)
  biggervalue = 0
  biggervaluepos = 0
  tablename = "Mesa X"
  tables.each do |table|
    if biggervalue < bigearning(table)[0]
      biggervalue = bigearning(table)[0]
      biggervaluepos = bigearning(table)[1] + 1
      tablename = table.name
    end
  end
  puts "La mayor recaudación fue de #{biggervalue}M USD, el día #{biggervaluepos} en la #{tablename}."

end

def bigearning(table)
  big = 0
  total = 0
  table.earnings.each do |score|
    total = total + score
    big = score if big < score
  end
  mean = total/4
  position = table.earnings.index(big)
  [big, position, mean]
end

def meanvalue(tables)
  total = 0
  tables.each do |table|
    total = total + bigearning(table)[2]
  end
  mean = total/tables.count
  puts "El promedio de todas las mesas es #{mean}."
end


file = File.open('casino.txt', 'r')
data = file.readlines
file.close

tables = []
data.each do |line|
  ls = line.split(', ')
  tables << Table.new(*ls)
end

bigearningtables(tables)
meanvalue(tables)
