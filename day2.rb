WIN = 6
DRAW = 3
LOST = 0

ROCK = 1
PAPER = 2
SCISSORS = 3
OUTCOMES = {
  "A" => {   # Rock
    "X" => LOST + SCISSORS,
    "Y" => DRAW + ROCK,
    "Z" => WIN + PAPER
  },
  "B" => {   # Paper
    "X" => LOST + ROCK,
    "Y" => DRAW + PAPER,
    "Z" => WIN + SCISSORS
  },
  "C" => { # Scissors
    "X" => LOST + PAPER,
    "Y" => DRAW + SCISSORS,
    "Z" => WIN + ROCK
  }
}

File.open(File.join(File.dirname(__FILE__),'day2.txt'), "r") do |f|
  points = 0
  f.each_line do |line|
    pair = line.chomp.split(" ")
    points += OUTCOMES[pair[0]][pair[1]]
  end
  p points
end
