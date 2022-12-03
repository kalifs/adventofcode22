
def value(c)
  case c.ord
  when 65..90
    c.ord - 65 + 27
  when 97..122
    c.ord - 96
  else
    0
  end
end

File.open(File.join(File.dirname(__FILE__),'day3.txt'), "r") do |f|
  sum = 0
  f.each_line do |line|
    cLine = line.chomp
    parts = [cLine.slice(0, cLine.size / 2), cLine.slice(cLine.size / 2, cLine.size)]
    overlap = parts[0].split("") & parts[1].split("")
    sum += value(overlap.first)
  end
  p sum
end
