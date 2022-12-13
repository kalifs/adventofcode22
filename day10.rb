File.open(File.join(File.dirname(__FILE__),'day9.txt'), "r") do |f|
  cycles = 0
  x = 1
  xchange = 0
  cchange = 0
  f.each_line do |line|
    input = line.chomp
    # puts input
    if input.start_with?("addx")
      cchange = 2
      xchange = input.split(" ").last.to_i
    else 
      cchange = 1
      xchange = 0
    end

    (cycles...(cycles+cchange)).each do |i|
      print ((x-1)..(x+1)).include?(i % 40) ? "#" : "."
      puts if (i+1) % 40 == 0 
    end

    x += xchange
    cycles += cchange
  end
end
puts
