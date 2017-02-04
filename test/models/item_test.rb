require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @admin = create(:admin_user)
  end

  test 'should be invalid without name' do
    item = build(:item, name: nil, updated_by: @admin.id)
    assert_not item.valid?
  end

  test 'should be invalid without quantity' do
    item = build(:item, quantity: nil, updated_by: @admin.id)
    assert_not item.valid?
  end

  test 'should be invalid without unit price' do
    item = build(:item, unit_price: nil, updated_by: @admin.id)
    assert_not item.valid?
  end

  test 'should be invalid if unit price is not in number' do
    item = build(:item, unit_price: 'dfsdfsdfsdf', updated_by: @admin.id)
    assert_not item.valid?
  end

  test 'should be valid' do
    item = build(:item, updated_by: @admin.id)
    assert item.valid?
  end

end
