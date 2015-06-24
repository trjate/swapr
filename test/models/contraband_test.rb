require 'test_helper'

class ContrabandTest < ActiveSupport::TestCase
  test "contraband must have an owner" do
    cb = Contraband.new
    refute cb.save, "Tried to save a user without an id"
  end

  test "can get the owner of contraband" do
    cb = contrabands(:tswift)
    assert_equal cb.user, users(:brit)
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
