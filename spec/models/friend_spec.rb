require 'rails_helper'


RSpec.describe Friend, type: :model do
  it "should validate name" do
    friend = Friend.create
    expect(friend.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    friend = Friend.create
    expect(friend.errors[:age]).to_not be_empty
  end

  it "should validate interests field" do
    friend = Friend.create
    expect(friend.errors[:enjoys]).to_not be_empty
  end

end
