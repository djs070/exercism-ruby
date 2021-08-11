=begin
Write your code for the 'Run Length Encoding' exercise in this file. Make the tests in
`run_length_encoding_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/run-length-encoding` directory.
=end

class RunLengthEncoding
  def self.encode(input)
    buf_char = ''
    buf_count = 0
    out = ''

    input.each_char do |char|
      if char == buf_char
        buf_count += 1
      else
        out = flush(out, buf_char, buf_count)
        buf_char = char
        buf_count = 1
      end
    end

    flush(out, buf_char, buf_count)
  end

  def self.flush(str, char, count)
    case count
    when 0 then str
    when 1 then str + char
    else str + count.to_s + char
    end
  end

  # Alternate implementation using nice functional methods
  # for benchmarking
  def self.encode_alt(input)
    input.each_char
         .chunk {|c| c}
         .map {|k, v| v.length > 1 ? v.length.to_s + k : k }
         .join
  end

  def self.decode(input)
    buf_count = '' # String of the count of proceeding character

    input.each_char.reduce('') do |out, char|
      if char.match /\d/
        buf_count += char
      else
        out += buf_count.length > 0 ? char * buf_count.to_i : char
        buf_count = ''
      end

      out
    end
  end
end
