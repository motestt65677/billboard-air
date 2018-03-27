require "rails_helper"
DatabaseCleaner.start
DatabaseCleaner.clean

RSpec.describe Board, :type => :model do

  subject {
    described_class.new(title: "billboard1", description: "sample description", current_price:200, location:"taipei", user_id: 1)
  }

  # before(:all) do
  #   @user1 = create(:user)
  #   @board1 = create(:board)
  #   @board2 = Board.new(title: "billboard1", description: "sample description", current_price:200, location:"taipei", user_id: 1)
  # end

  it { expect(@board1).to belong_to(:user) }
  it { expect(@board1).to have_many(:bids) }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a user" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "raise an error without title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a current_price" do
    subject.current_price = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a location" do
    subject.location = nil
    expect(subject).to_not be_valid
  end

end