File.open(File.join(File.dirname(__FILE__),'day1.txt'), "r") do |f|

  results = []

  sum = 0

  f.each_line do |line|
    value = line.chomp
    if value == ""
      results << sum
      sum = 0
    else
      sum += value.to_i
    end
  end

  p results
  p results.max
  p results.sort.reverse.slice(0..2).sum
end
