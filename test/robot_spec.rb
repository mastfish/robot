require_relative '../lib/robot'
require 'stringio'

RSpec.describe Robot do

  before do
    $stdout = StringIO.new
    @robot = Robot.new(1,2, "east")
  end

  after(:all) do
    $stdout = STDOUT
  end

  it "is creatable" do
    expect(Robot.new(1,2, "east")).to be_an_instance_of(Robot)
  end

  it "accepts report" do
    @robot.command("report")
    expect($stdout.string).to match(/1,2,EAST\n/)
  end

  it "accepts move" do
    @robot.command("move")
    @robot.command("report")
    expect($stdout.string).to match(/2,2,EAST\n/)
  end

  it "accepts left" do
    @robot.command("left")
    @robot.command("report")
    expect($stdout.string).to match(/1,2,NORTH\n/)
  end

  it "accepts right" do
    @robot.command("right")
    @robot.command("report")
    expect($stdout.string).to match(/1,2,SOUTH\n/)
  end

  it "4 rights get back to the start" do
    4.times do
      @robot.command("right")
    end
    @robot.command("report")
    expect($stdout.string).to match(/1,2,EAST\n/)
  end

  it "4 lefts get back to the start" do
    4.times do
      @robot.command("left")
    end
    @robot.command("report")
    expect($stdout.string).to match(/1,2,EAST\n/)
  end

  it "won't move off the table east" do
    3.times do
      @robot.command("move")
    end
    @robot.command("report")
    expect($stdout.string).to match(/4,2,EAST\n/)
    expect{@robot.command("move")}.to raise_error
  end

  it "won't move off the table north" do
    @robot.command("left")
    2.times do
      @robot.command("move")
    end
    @robot.command("report")
    expect($stdout.string).to match(/1,4,NORTH\n/)
    expect{@robot.command("move")}.to raise_error
  end

  it "won't move off the table west" do
    @robot.command("left")
    @robot.command("left")
    @robot.command("move")
    @robot.command("report")
    expect($stdout.string).to match(/0,2,WEST\n/)
    expect{@robot.command("move")}.to raise_error
  end

  it "won't move off the table south" do
    @robot.command("right")
    2.times do
      @robot.command("move")
    end
    @robot.command("report")
    expect($stdout.string).to match(/1,0,SOUTH\n/)
    expect{@robot.command("move")}.to raise_error
  end

  it "won't allow itself to be placed off the table" do
    expect{Robot.new(5,0, "east")}.to raise_error
    expect{Robot.new(-1,0, "east")}.to raise_error
    expect{Robot.new(0,-1, "east")}.to raise_error
    expect{Robot.new(0,5, "east")}.to raise_error
  end

  it "won't allow itself to be placed with a weird facing" do
    expect{Robot.new(0,0, "blurst")}.to raise_error
    expect{Robot.new(0,0, 7)}.to raise_error
  end

  it "example A" do
    robot = Robot.new(0,0, "north")
    robot.command("move")
    robot.command("report")
    expect($stdout.string).to match(/0,1,NORTH\n/)
  end

  it "example B" do
    robot = Robot.new(0,0, "north")
    robot.command("left")
    robot.command("report")
    expect($stdout.string).to match(/0,0,WEST\n/)
  end

  it "example C" do
    robot = Robot.new(1,2, "east")
    robot.command("move")
    robot.command("move")
    robot.command("left")
    robot.command("move")
    robot.command("report")
    expect($stdout.string).to match(/3,3,NORTH\n/)
  end

end