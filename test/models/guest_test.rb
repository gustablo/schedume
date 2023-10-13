require "test_helper"

class GuestTest < ActiveSupport::TestCase

  def setup
    @guest = guests(:one)
  end

  test 'should be valid' do
    assert @guest.valid?
  end

  test 'name should be present' do
    @guest.name = '      '
    assert_not @guest.valid?
  end

  test 'email should be present' do
    @guest.email = '      '
    assert_not @guest.valid?
  end

  test 'should save timestamps' do
    @guest.save
    assert_not_nil @guest.created_at
    assert_not_nil @guest.updated_at
  end

  test 'should have many invites' do
    assert_respond_to @guest, :invites
  end

  test 'should have many schedules' do
    assert_respond_to @guest, :schedules
  end
end
