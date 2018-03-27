require 'rails_helper'
RSpec.describe "sign in", :type => :feature do
  before(:all) do
    @user1 = create(:user)
    @user1.password=("asdfasdf")
    @user1.save

    @board1 = create(:board)
    @board2 = Board.new(title: "billboard1", description: "sample description", current_price:200, location:"taipei", user_id: 1)
  end


  # let(:user){
  #   User.create({password_digest: "asdfasdf", email:"asdf@gmail.com",  first_name:"John", last_name: "Doe"})
  # }
    
  describe "the signin process", :type => :feature do

    it "signs me in" do
      visit '/sign_in'
      fill_in 'email', with: 'asdf@gmail.com'
      fill_in 'password', with: 'asdfasdf'
      click_button 'Sign In'
      expect(page).to have_current_path("/")
    end

    it "sign up" do
      visit '/sign_up'
      fill_in 'user[first_name]', with: 'John'
      fill_in 'user[last_name]', with: 'Doe'
      fill_in 'user[email]', with: 'pkpk@gmail.com'
      fill_in 'password', with: 'asdfasdf'
      fill_in 'password_confirmation', with: 'asdfasdf'
      click_button 'Sign Up'
      expect(page).to have_current_path("/boards")
    end
  end


end