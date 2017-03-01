require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  context "Associations" do
    should belong_to :user
    should belong_to :post
  end

  context "Validations" do
    should validate_presence_of :body
  end

  test "Test presences" do
    comment = build(:comment)
    comment.user = nil
    refute comment.save
    comment.user = create(:user)
    comment.post = nil
    refute comment.save
    comment.post = create(:post)
    assert comment.save
  end

end
