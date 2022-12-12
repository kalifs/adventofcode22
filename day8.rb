require_relative 'utils'
require 'matrix'

def visibles(l)
  output = []
  
  l.each do |e|
    vt = l.slice(0, output.size).reverse.take_while { |prev| prev < e }
    output << (vt.size < output.size && output.size > 0 ? vt.size + 1 : vt.size)
  end

  output
end

def list_visibles(l)
  v = visibles(l)
  visibles(l.reverse).reverse.map.with_index {|e,i| e * v[i] }
end

File.open(File.join(File.dirname(__FILE__),'day8.txt'), "r") do |f|
  grid = []
  f.each_line do |line|
    grid << line.chomp.split("").map(&:to_i)
  end

  g_mapped = grid.map {|row| list_visibles(row) }
  t_mapped = Matrix[*grid].transpose.to_a.map { |row| list_visibles(row) }

  result = g_mapped.map.with_index { |row, i|
    row.map.with_index { |c, j| t_mapped[j][i] * c }
  }
  p result.reduce(0) {|max, row| [max, row.max].max }
end

