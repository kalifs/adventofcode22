WIN = 6
DRAW = 3
LOST = 0

ROCK = 1
PAPER = 2
SCISSORS = 3
OUTCOMES = {
  "A" => {   # Rock
    "X" => ROCK + DRAW, # Rock
    "Y" => PAPER + WIN, # Paper
    "Z" => SCISSORS + LOST  # Scissors
  },
  "B" => {   # Paper
    "X" => ROCK + LOST, # Rock
    "Y" => PAPER + DRAW, # Paper
    "Z" => SCISSORS + WIN  # Scissors
  },
  "C" => { # Scissors
    "X" => ROCK + WIN, # Rock
    "Y" => PAPER + LOST, # Paper
    "Z" => SCISSORS + DRAW  # Scissors
  }
}

File.open(File.join(File.dirname(__FILE__),'day2.txt'), "r") do |f|
  points = 0
  f.each_line do |line|
    pair = line.chomp.split(" ")
    begin
      points += OUTCOMES[pair[0]][pair[1]]
    rescue
      p line
      p pair
    end
  end
  p points
end
