require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:valid)
  end

  test 'User must be valid' do
    assert @user.valid?, 'User is not valid'
  end

  test 'User cant be without email' do
    @user.email = nil
    assert_not @user.valid?, 'User is without email'
  end

  test 'Email must be unique' do
    user2 = users(:user2)
    user2.email = @user.email
    assert_not user2.valid?, 'Email already exists'
  end

  test 'User cant be without password' do
    @user.encrypted_password = nil
    assert_not @user.valid?, 'User is without password'
  end
end
