require 'date'
BEGIN_OF_JULY = Date.new(2015, 7, 1)
END_OF_JULY = Date.new(2015, 7, 31)
DAY_IN_JULY = Date.new(2015, 7, 15)

def fast
  BEGIN_OF_JULY < DAY_IN_JULY && DAY_IN_JULY < END_OF_JULY
end
def avg
  (BEGIN_OF_JULY..END_OF_JULY).cover? DAY_IN_JULY
end
def slowest
  (BEGIN_OF_JULY..END_OF_JULY).include? DAY_IN_JULY
end

require 'benchmark/ips'
Benchmark.ips do |bm|
  bm.report('Range#cover?') {avg}
  bm.report('Range#include?') {slowest}
  bm.report('Plain compare') {fast}
  bm.compare!
end