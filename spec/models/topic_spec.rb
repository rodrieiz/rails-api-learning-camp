require 'rails_helper'

RSpec.describe Topic, type: :model do
  
  before(:all) do 
    @topic1 = create(:topic)
  end

  it "valid topic" do
    expect(@topic1).to be_valid
  end

  it "invalid topic attributes, duplicate name" do
    @topic2 = build(:topic , name: @topic1.name)
    expect(@topic2).to_not be_valid
  end

  it "invalid topic attributes, missing name" do
    @topic3 = build(:topic, name: nil)
    expect(@topic3).to_not be_valid
  end

end
