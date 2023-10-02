require "test_helper"

class PostTest < ActiveSupport::TestCase
  context "associations" do
    should belong_to(:user)
  end

  context "validations" do
    should validate_presence_of(:content)
  end
end
