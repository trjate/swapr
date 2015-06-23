require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can't save an empty user" do
    user = User.new
    refute user.save
  end

  test "user emails must be unique" do
    bob1 = User.new(email: "bob@internet.com", password: "hunter2")
    bob2 = User.new(email: "bob@internet.com", password: "*******")
    assert bob1.save
    refute bob2.save, "Tried to save user with duplicate email"
  end
end
