class Robot

  VALID_FACINGS = [
    "north", "south", "east", "west"
  ]

  VALID_COMMANDS = [
    "move", "left", "right", "report"
  ]

  def initialize(in_x, in_y, in_facing)
    self.x = in_x.to_i
    self.y = in_y.to_i
    self.facing = in_facing
  end

  def command(input)
    raise unless VALID_COMMANDS.include? input
    self.send(input)
  end

  def move
    puts "move called"
  end

  def left
    puts "left called"
  end

  def right
    puts "right called"
  end

  def report
    puts "#{@x},#{@y},#{@facing.upcase}"
  end

  private

  def x=(input)
    raise unless on_board?(input)
    @x = input
  end

  def y=(input)
    raise unless on_board?(input)
    @y = input
  end

  def facing=(input)
    raise unless VALID_FACINGS.include? input
    @facing = input
  end

  def on_board?(input)
    (0..4).include?(input)
  end

end