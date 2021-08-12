class Phrase
  attr_accessor :word_count

  def initialize(input)
    @word_count = input.downcase
                       .scan(/\b[\w']+\b/) # split words
                       .inject(Hash.new(0)) { |c, w| c[w] += 1; c } # count
  end
end
