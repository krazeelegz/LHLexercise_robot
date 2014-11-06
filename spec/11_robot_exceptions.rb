require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
   
  end
  
  describe "#heal!" do
    it "should raise an error if health is less than or equal to zero" do
      @robot.wound(100)
      expect(@robot.health).to eq(0)
      expect{@robot.heal!(5)}.to raise_error(CustomError::DeadRobotError, "your robot is dead and can not be revived")
    end 
  end

  describe "#attack!"
  it "should raise an error if anthing other than robot is being attacked" do
      item = Item.new("human", 10)
      expect{@robot.attack!(item, 5)}.to raise_error(CustomError::FightRobotOnly, "you can only fight robots")
    end 

end