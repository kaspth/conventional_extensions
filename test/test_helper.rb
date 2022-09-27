# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "conventional_extensions"

require "fixtures/record"
require "fixtures/post"
require "fixtures/camel_cased"
require "fixtures/organization/user"

require "minitest/autorun"
