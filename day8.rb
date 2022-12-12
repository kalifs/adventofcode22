require_relative 'utils'
require 'matrix'

def visibles(l)
  output = []
  max = -1
  l.each do |e|
    output << (e > max )
    max = e if e > max
  end

  output
end

def list_visibles(l)
  o = visibles(l.reverse).reverse
  visibles(l).map.with_index { |e, i| e || o[i]  }
end

File.open(File.join(File.dirname(__FILE__),'day8.txt'), "r") do |f|
  grid = []
  og = []
  f.each_line do |line|
    grid << line.chomp.split("").map(&:to_i)
  end

  g_mapped = grid.map {|row| list_visibles(row) }
  t_mapped = Matrix[*grid].transpose.to_a.map { |row| list_visibles(row) }

  result = g_mapped.map.with_index { |row, i|
    row.map.with_index { |c, j| t_mapped[j][i] || c }
  }

  p result.reduce(0) {|sum, row| sum += row.reduce(0) {|isum, c| isum + (c ? 1 : 0)} }
end

