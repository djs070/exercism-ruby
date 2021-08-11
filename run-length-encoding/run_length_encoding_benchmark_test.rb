require 'minitest/autorun'
require 'minitest/benchmark'
require_relative 'run_length_encoding'

class RunLengthEncodingBenchmark < Minitest::Benchmark
  REPEATS = 100

  def random_string(len)
    # Generates random strings only consisting of "ABC"
    # to ensure high enough repetition rate
    (0...len).map { (65 + rand(3)).chr }.join
  end

  def bench_encode
    assert_performance_linear 0.99 do |len|
      str = random_string(len)
      REPEATS.times do
        RunLengthEncoding.encode(str)
      end
    end
  end

  def bench_encode_alt
    assert_performance_linear 0.99 do |len|
      str = random_string(len)
      REPEATS.times do
        RunLengthEncoding.encode_alt(str)
      end
    end
  end
end
