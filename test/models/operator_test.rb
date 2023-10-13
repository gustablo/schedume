require "test_helper"

class OperatorTest < ActiveSupport::TestCase
  def setup
    @operator = operators(:one)
  end

  test 'should be valid' do
    assert @operator.valid?
  end

  test 'name should be present' do
    @operator.name = '   '
    assert_not @operator.valid?
  end

  test 'email should be present' do
    @operator.email = '   '
    assert_not @operator.valid?
  end

  test 'should save operator with secure password' do
    assert @operator.save
  end

  test 'should have authenticate method' do
    assert @operator.save
    assert_respond_to @operator, :authenticate
  end

end
