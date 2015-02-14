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
    STDERR.puts "I can't let you do that, #{`whoami`}"
  end
end
