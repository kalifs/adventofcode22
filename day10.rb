File.open(File.join(File.dirname(__FILE__),'day9.txt'), "r") do |f|
  cycles = 0
  x = 1
  xchange = 0
  sum = 0
  f.each_line do |line|
    # puts "cmd: #{line}"
    input = line.chomp
    # puts "before: x: #{x}"
    
    if input.start_with?("addx")
      cycles += 2
      xchange = input.split(" ").last.to_i
    else 
      cycles += 1
      xchange = 0
    end

    if (cycles - 20) % 40 == 0 
      sum += cycles * x
    end 
    # puts "after: cycle: #{cycles} x: #{x + xchange}"
    x += xchange
  end
  puts sum
end
