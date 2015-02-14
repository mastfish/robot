require_relative 'lib/robot'

robot = nil
loop do
  begin
    cmd = gets.downcase.strip
    if cmd.index("place") == 0
      args = cmd.gsub(',', ' ').split(' ')
      # Drop the PLACE part
      args.shift 
      robot = Robot.new(*args)
    elsif robot
      robot.command(cmd)
    else
      raise "robot must be placed first"
    end
  rescue
    STDERR.puts "\033[31mI can't let you do that, #{`whoami`.strip}\033[0m"
  end
end
