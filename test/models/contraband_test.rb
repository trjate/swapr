require 'test_helper'

class ContrabandTest < ActiveSupport::TestCase
  test "contraband must have an owner" do
    cb = Contraband.new
    refute cb.save
    # Electing not to define a complementary
    # assert test here to avoid having to
    # add test files or "fake" the attachment.
  end

  test "can get the owner of contraband" do
    cb = contrabands(:tswift)
    assert_equal cb.user, users(:brit)
  end

  test "contraband must be under 10mb" do
    file_attrs = {
      user_id: 1,
      contraband_file_size: 10999999,
      contraband_file_name: 'foo.bar',
      contraband_updated_at: DateTime.now,
      contraband_content_type: 'text/bar'
    }
    cb = Contraband.new(file_attrs)
    refute cb.save

    cb.contraband_file_size = 8888888
    assert cb.save
  end
end
