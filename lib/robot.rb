class Robot

  MAX_BOARD_INDEX = 4

  VALID_COMMANDS = [
    "move", "left", "right", "report"
  ]

  LEFT_MAPPING = {
    "north" => "west",
    "west" => "south",
    "south" => "east",
    "east" => "north",
  }

  RIGHT_MAPPING = LEFT_MAPPING.invert

  VALID_FACINGS = LEFT_MAPPING.keys

  def initialize(in_x, in_y, in_facing)
    self.x = in_x.to_i
    self.y = in_y.to_i
    self.facing = in_facing
  end

  def command(input)
    raise unless VALID_COMMANDS.include? input
    self.send(input)
  end

  private

  def move
    case @facing
    when "north"
      self.y = @y + 1
    when "east"
      self.x = @x + 1
    when "south"
      self.y = @y - 1
    when "west"
      self.x = @x - 1
    end
  end

  def left
    self.facing = LEFT_MAPPING[@facing]
  end

  def right
    self.facing = RIGHT_MAPPING[@facing]
  end

  def report
    puts "#{@x},#{@y},#{@facing.upcase}"
  end

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
    (0..MAX_BOARD_INDEX).include?(input)
  end

end