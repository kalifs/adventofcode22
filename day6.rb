File.open(File.join(File.dirname(__FILE__),'day6.txt'), "r") do |f|
  groupLen = 4
  f.each_line do |line|
    l = line.chomp
    i = groupLen
    found = false
    while i < l.size && !found 
      group = l.slice(i - groupLen, groupLen)
      found = group.split("").uniq.size == groupLen
      i += 1
    end
    p i - 1
  end
end
