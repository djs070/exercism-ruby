class ETL
  # Accepts a hash of scores => list of letters
  # returns transposed letter => score
  # e.g. from
  # { 1 => ["A"] }
  # to
  # { 'a' => 1 }
  def self.transform(input)
    input.each.reduce({}) do |out, score|
      # score is a tuple e.g. [1, ['A']]
      score[1].each do |letter|
        out[letter.downcase] = score[0]
      end
      out
    end
  end
end
