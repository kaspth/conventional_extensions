# frozen_string_literal: true

require "test_helper"

class TestConventionalExtensions < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ConventionalExtensions::VERSION
  end

  def test_load_on_inherited_calls_load_extensions_when_inherited
    klass = Class.new do
      extend ConventionalExtensions.load_on_inherited

      def self.load_extensions(*)
        raise NotImplementedError
      end
    end

    assert_raises NotImplementedError do
      Class.new(klass)
    end
  end
end
