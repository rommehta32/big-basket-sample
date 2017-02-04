require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should be invalid without email' do
    user = build(:user, email: nil)
    assert_not user.valid?
  end

  test 'should be valid with email' do
    user = build(:user)
    assert user.valid?
  end
end
