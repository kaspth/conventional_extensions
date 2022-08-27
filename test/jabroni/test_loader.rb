require "test_helper"

class Jabroni::TestLoader < Minitest::Test
  def test_methods_added
    assert_equal "cool", Post.cool
    assert_predicate Post.cool, :frozen?

    assert_equal "mailroom", Post.new.mailroom
    assert_predicate Post.new.mailroom, :frozen?
  end

  def test_custom_loading_happened
    assert_equal :from_mailroom, Post.new.named_something
  end
end
