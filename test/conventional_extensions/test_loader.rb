require "test_helper"

class ConventionalExtensions::TestLoader < Minitest::Test
  def test_methods_added
    assert_equal "cool",     Post.cool
    assert_equal "mailroom", Post.new.mailroom
  end

  def test_camel_cased_naming_works
    assert_predicate CamelCased.new, :loading?
  end

  def test_loads_nested_extension_in_separate_file
    assert_equal "Leslie", Organization::User.new.first_name
  end

  def test_frozen_string_literals
    refute_predicate Post.thawed_boi, :frozen?
    assert_predicate Post.cool, :frozen?
    assert_predicate Post.new.mailroom, :frozen?
  end

  def test_module_definition_in_extension
    assert defined?(Post::Submarine)
    assert_equal :subsubsub, Post.subsubsub
    assert_equal :subsubsub, Post.new.subsubsub
  end

  def test_class_method_macros_are_available_in_extensions_and_class
    assert_equal :from_mailroom, Post.new.named_something_from_mailroom
    assert_equal :from_post, Post.new.named_something_from_post
  end

  def test_custom_loading_didnt_load_hoisted_extension_twice
    assert_equal 1, $named_extension_loading_count
  end

  def test_active_record_doesnt_need_to_call_load_extensions
    assert_equal :extension, Record.extension
  end
end
