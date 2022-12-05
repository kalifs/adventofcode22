File.open(File.join(File.dirname(__FILE__),'day4.txt'), "r") do |f|
  covers = 0
  f.each_line do |line|
    ranges = line.chomp.split(",").map {|r| r.split("-").map(&:to_i) }
    r1 = (ranges[0][0]..ranges[0][1]).to_a
    r2 = (ranges[1][0]..ranges[1][1]).to_a
    if !(r1 & r2).empty?
      covers += 1
    end
  end
  p covers
end
