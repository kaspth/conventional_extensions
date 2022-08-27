require "test_helper"

class Jabroni::TestLoader < Minitest::Test
  def test_methods_added
    assert_equal "cool",     Post.cool
    assert_equal "mailroom", Post.new.mailroom
  end

  def test_frozen_string_literals
    refute_predicate Post.thawed_boi, :frozen?
    assert_predicate Post.cool, :frozen?
    assert_predicate Post.new.mailroom, :frozen?
  end

  def test_custom_loading_happened
    assert_equal :from_mailroom, Post.new.named_something
  end

  def test_custom_loading_didnt_load_hoisted_extension_twice
    assert_equal 1, $named_extension_loading_count
  end
end
