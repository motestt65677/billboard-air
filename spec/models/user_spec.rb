require 'rails_helper'

RSpec.describe User, :type => :model do
  subject{User.new(email:"sample@gmail.com", first_name:"John", last_name:"Doe")}
  it "is valid with proper input" do
    expect(subject).to be_valid
  end
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end
  it "has many boards" do 
    t = User.reflect_on_association(:boards)
    expect(t.macro).to eq(:has_many)
  end

  it "has many bids" do
    t = User.reflect_on_association(:bids)
    expect(t.macro).to eq(:has_many)
  end
  it "has many authentications" do
    t = User.reflect_on_association(:authentications)
    expect(t.macro).to eq(:has_many)
  end
end