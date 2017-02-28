require 'test_helper'

class UserTest < ActiveSupport::TestCase

  context "Associations" do
    should have_many(:posts)
  end

  context "Validations" do
    should validate_presence_of :email
    should validate_presence_of :username
  end

  # def setup
  #   @user = FactoryGirl.build(:user)
  # end
  #
  # test "Should have an email" do
  #   @user.email = nil
  #   refute @user.save
  # end
  #
  # test "Should have an username" do
  #   @user.username = nil
  #   refute @user.save
  # end

end
