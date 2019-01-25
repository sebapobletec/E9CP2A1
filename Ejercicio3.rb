# Methods and classes
r = (1..10).to_a

class Roulette

  attr_accessor :numbers, :historic_numbers, :historic_winners
  def initialize(numbers)
    @numbers = numbers
    @historic_numbers = []
    @historic_winners = []
  end

  def play(lucky_number)
    lucky_number = lucky_number.to_i
    random_number = rand(1..10)
    @historic_numbers << random_number
    if @numbers[random_number-1] == lucky_number
      @historic_winners << random_number
    end
  end

  def save_history
    h = File.open('roulette_history.txt', 'w+') do |h|
      @historic_numbers.each { |number| h.print("#{number} ")}
    end
    w = File.open('winners.txt', 'w') do |w|
      @historic_winners.each { |number| w.print("#{number} ")}
    end

  end

  def most_repeated(file_name)
    file = File.open(file_name, 'r')
    data = file.read
    file.close
    numbers = []
    data = data.split(' ')
    data.each do |number|
      numbers << number.to_i
    end
    frequencie = numbers.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    numbers.max_by { |v| frequencie[v] }
  end


end

# Program
roulette1 = Roulette.new(r)
100.times { roulette1.play(rand(1..10)) }
roulette1.save_history
print roulette1.most_repeated('roulette_history.txt')
