stacks = []
read_stack = true

File.open(File.join(File.dirname(__FILE__),'day5.txt'), "r") do |f|
  f.each_line do |line|
    if line.chomp.strip == "" && read_stack
      stacks.map! {|stack| stack.compact }
      read_stack = false
    end

    if read_stack
      lparts = line.chomp.scan(/(.{3}\s{0,1})/).flatten
      if line =~ /\[/
        parts = lparts.map {|p| p.match(/\[(\w{1})\]\s*/) ? $1 : nil }
        parts.each.with_index {|part,i| stacks[i] ? stacks[i].push(part) : stacks.push([part]) }
      end
    end

    if !read_stack && line.chomp.strip != ""
      move_matches = line.match(/[^\d]*(\d+)[^\d]*(\d+)[^\d]*(\d+)/)
      moves = move_matches.to_a.slice(1..4).map(&:to_i)
      moves[0].times do 
        obj = stacks[moves[1] - 1].shift
        stacks[moves[2] - 1].unshift(obj)
      end
    end
  end
end

p stacks.map {|s| s[0] }.join("")
