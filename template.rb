require 'benchmark/ips'

def fast
  sleep(1)
end
def slow
  sleep(2)
end

Benchmark.ips do |bm|
  bm.report("fast code description") {fast}
  bm.report("slow code description") {slow}
  bm.compare!
end