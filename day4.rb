File.open(File.join(File.dirname(__FILE__),'day4.txt'), "r") do |f|
  covers = 0
  f.each_line do |line|
    ranges = line.chomp.split(",").map {|r| r.split("-").map(&:to_i) }
    r1 = ranges[0][0]..ranges[0][1]
    r2 = ranges[1][0]..ranges[1][1]
    if r1.cover?(r2) || r2.cover?(r1)
      covers += 1
    end
  end
  p covers
end
