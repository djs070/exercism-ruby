class ResistorColorDuo
  VALUES = {
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9
  }

  # Accepts a list of colors and returns
  # the resistor value
  def self.value(colors)
    # VALUES[colors[0]] * 10 + VALUES[colors[1]] # lol
    colors.take(2)
          .map(&VALUES)
          .inject(0) { |out, value| out * 10 + value }
  end
end
