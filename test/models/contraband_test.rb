require 'test_helper'

class ContrabandTest < ActiveSupport::TestCase
  setup :initialize_example_attrs

  test "contraband must have an owner" do
    cb = Contraband.new
    refute cb.save
  end

  test "can get the owner of contraband" do
    cb = contrabands(:tswift)
    assert_equal cb.user, users(:brit)
  end

  test "contraband may be in a folder or not" do
    custom_attrs = { name: 'glass swords', user: users(:brit) }
    attrs = @file_attrs.merge(custom_attrs)
    rustie = Contraband.new(attrs)
    assert rustie.save

    rustie.curation = curations(:brits_music)
    assert_equal rustie.curation, curations(:brits_music)
    assert rustie.save
  end

  test "contraband must be under 10mb" do
    cb = Contraband.new(@file_attrs)
    refute cb.save

    cb.contraband_file_size = 8888888
    assert cb.save
  end

  def initialize_example_attrs
    @file_attrs = {
      user_id: 1,
      contraband_file_size: 10999999,
      contraband_file_name: 'foo.bar',
      contraband_updated_at: DateTime.now,
      contraband_content_type: 'text/bar'
    }
  end
end
