class Matrix
  def initialize(str)
    @str = str
  end

  def rows
    @str.split("\n")
        .map{ |row| row.split.map(&:to_i) }
  end

  def columns
    rows.transpose
  end
end
