require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new
  end

  test 'post with a body should be valid' do
    @post.body = 'test'
    assert @post.valid?
  end

  test 'post should not be valid without a body' do
    refute @post.valid?
  end
end
