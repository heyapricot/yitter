require "test_helper"

class UserTest < ActiveSupport::TestCase

  context 'assocations' do
    should have_many(:posts)
  end

  context 'validations' do
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
  end

end
