require 'set'

class SumOfMultiples
  def initialize(*multiplicands)
    @multiplicands = multiplicands
  end

  def to(limit)
    set = Set.new

    @multiplicands.each do |m|
      next if m < 1

      multiple = m
      while multiple < limit
        set.add(multiple)
        multiple += m
      end
    end

    set.inject(0, :+)
  end
end