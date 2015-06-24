require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "users must have email and password" do
    u = User.new(email: 'cookies')
    refute u.save
    u = User.new(password: 'pooches')
    refute u.save
    u = User.new(email: 'foo@bar.com',
                 password: 'dogsandstuff')
    assert u.save
  end

  test "emails must resemble an email" do
    u = User.new(email: 'no_at_symbol',
                 password: 'cookies')
    refute u.save
  end

  test "users get access token on save" do
    u = User.new(email: 'cool@runnings.com',
                 password: 'stuff')
    assert u.save
    assert_not_empty u.access_token
  end

  test "can easily generate new token" do
    u = users(:brit)
    old_token = u.access_token
    u.regenerate_token!
    assert_not_empty u.access_token
    assert_not_equal old_token, u.access_token
  end
end
