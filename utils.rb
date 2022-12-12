def ppstack(s)
  rs = s.map {|se| se.reverse }
  ml = s.max {|a, b| a.size <=> b.size }.size
  ml.times do |i| 
    puts rs.map{|se| 
      if(ml - i - 1 < se.size)
        se[ml - i - 1] || "!" 
      else 
        " "
      end
  }.join(" ")
  end
  puts (1..(rs.size)).to_a.join(" ")
  puts "=" * 100
end


def ppmatrix(m)
  m.each do |r|
    puts r.join(" ")
  end
end

def ppbmatrix(m) 
  m.each do |r|
    puts r.map{|e| e ? "1" : "0"}.join(" ")
  end
end
