require_relative '../lib/engine'
require 'stringio'

RSpec.describe Engine do

  it "accepts PLACE" do
    expect(Engine).to receive(:place_robot)
    Engine.run_command "PLACE 1,2,EAST"
  end

  it "raises unless robot placed" do
    expect{Engine.run_command "BLARG"}.to raise_error
  end

  it "delegates commands to the robot, if robot available" do
    robot = double("robot")
    expect(robot).to receive(:command) { "test" }
    Engine.instance_variable_set(:@robot, robot)
    Engine.run_command "test"
  end

  it "doesn't delegates place commands to the robot" do
    robot = double("robot")
    expect(robot).to_not receive(:command)
    Engine.instance_variable_set(:@robot, robot)
    Engine.run_command "PLACE 1,2,EAST"
  end

end