require 'pry'
require_relative 'lib/robot'

robot = nil
loop do
  # begin
    cmd = gets.downcase.strip
    if cmd.index("place") == 0
      puts 'place detected'
      args = cmd.gsub(',', ' ').split(' ')
      # Drop the PLACE part
      args.shift 
      robot = Robot.new(*args)
    elsif robot
      robot.command(cmd)
    else
      raise "no robot"
    end
  # rescue e
  #   p e
  # end

end
