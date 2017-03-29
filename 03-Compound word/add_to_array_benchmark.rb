require 'benchmark'

@words_array1 = []
@words_array2 = []

file = File.open("wordlist.txt")
Benchmark.bm do |x|

  x.report('<<  : ') do
    file.each_line do |line|
      line.chomp!
      @words_array1 << line
    end
  end

  x.report('push: ') do
    file.each_line do |line|
      line.chomp!
      @words_array2.push line
    end
  end

end
