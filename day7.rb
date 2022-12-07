require 'pp'
def run_cmd(current_dir, input)
  md = input.match(/^\$\s+(\w+)\s*(.+)?\s*$/)
  cmd = md[1]
  args = md[2]
  dir = current_dir
  if cmd == "cd"
    if args == ".."
      dir = dir.sub(/\w+\/$/, "")
    else 
      dir = "#{dir}#{args}#{args == "/" ? "" : "/"}"
    end
  elsif cmd == "ls"
    # do nothing
  end
  dir
end

def get_content(input)
  unless input.start_with?("dir")
    return input.match(/^(\d+)\s+(.+)$/).to_a.slice(1,2)
  end
  []
end

def totals(tree)
  sum = 0
  tree.each do |(k,v)|
    if v.is_a?(Hash)
      sum += totals(v)
    else 
      sum += v
    end
  end
  tree["_total"] = sum
  sum 
end

def tally(tree, limit)
  sum = 0
  tree.each do |(k, v)|
    if v.is_a?(Hash)
      sum += tally(v, limit)
    elsif k == "_total" 
      sum += v if v <= limit
    end
  end
  sum
end

tree = {}
current_dir = nil

File.open(File.join(File.dirname(__FILE__),'day7.txt'), "r") do |f|
  f.each_line do |line|
    input = line.chomp
    if input[0] == "$"
      current_dir = run_cmd(current_dir, input)
      root = tree
      current_dir.split("/").each do |part|
        next if part == ""
        root[part] = {} unless root[part]
        root = root[part]
      end
      # p tree
    else
      content = get_content(input)
      dir = current_dir == "/" ? tree : tree.dig(*(current_dir.split("/").reject(&:empty?)))
      dir[content[1]] = content[0].to_i if content.any?
    end
  end

  totals(tree)
  p tally(tree, 100_000)
end
