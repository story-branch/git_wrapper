$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "minitest/autorun"
require "minitest/spec"
require "minitest/reporters"
require "story_branch/git"

Minitest::Reporters.use!
