require_relative 'lib/engine'

loop do
  begin
    command = gets.downcase.strip
    Engine.run_command command
  rescue
    STDERR.puts "\033[31mI'm sorry, #{`whoami`.strip}. I'm afraid I can't do that.\033[0m"
  end
end
