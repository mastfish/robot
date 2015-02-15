require_relative 'robot'
class Engine

  class << self

    def run_command input
      command = input.downcase.strip
      if command.index("place") == 0
        place_robot(command)
      elsif @robot
        @robot.command(command)
      else
        raise "robot must be placed first"
      end
    end

    private

    def place_robot command
      args = command.gsub(',', ' ').split(' ')
      # Drop the PLACE part - we only care about following arguments
      args.shift 
      @robot = Robot.new(*args)
    end

  end

end