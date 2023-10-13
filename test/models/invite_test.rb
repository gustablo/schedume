require "test_helper"

class InviteTest < ActiveSupport::TestCase
  def setup
    @invite = invites(:one)
  end

  test "should be valid" do
    assert @invite.valid?
  end

  test "should respond to guest relationship" do
    assert_respond_to @invite, :guest
  end

  test "should respond to operator relationship" do
    assert_respond_to @invite, :operator
  end

  test "should save default empty fields" do
    @invite.possible_confirmed_dates = "2023-01-01, 2023-01-02"
    @invite.possible_confirmed_datetimes = {
      "2023-01-01": {
        start: ["00:00", "00:01"],
        end: ["00:00", "00:02"],
      },
      "2023-01-02": {
        start: ["00:00", "00:01"],
        end: ["00:00", "00:02"],
      },
    }

    assert @invite.save
  end

  test "[possible_confirmed_dates_to_a] should convert to array" do
    @invite.possible_confirmed_dates = "2023-01-01, 2023-01-02"

    confirmed_dates = @invite.possible_confirmed_dates_to_a
    expected_confirmed_dates = %w[2023-01-01 2023-01-02]

    assert_equal expected_confirmed_dates, confirmed_dates
  end

  test "[possible_confirmed_dates_to_a] should return nil when possible_confirmed_dates is nil" do
    assert_equal nil, @invite.possible_confirmed_dates_to_a
  end
end
