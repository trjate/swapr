require 'test_helper'

class ContrabandTest < ActiveSupport::TestCase
  test "contraband must have an owner" do
    cb = Contraband.new
    refute cb.save, "no user id set"
  end

  test "can get the owner of contraband" do
    cb = Contraband.create(user_id: 1)
    assert_instance_of(User, cb.user)
  end

  test "contraband must be under 10mb" do
    cb = Contraband.new(user_id: 1,
                        contraband_file_size: 10999999)
    refute cb.save, "Can't save files larger than 10mb"
  end

  # test "the truth" do
  #   assert true
  # end
end
