# frozen_string_literal: true

require "test_helper"

class StoryBranch::Git::WrapperMock < StoryBranch::Git::Wrapper
  def initialize(command_output)
    super()
    @command_output = command_output
  end

  def `(cmd)
    @command_output
  end
end

class StoryBranch::Git::WrapperTest < Minitest::Test
  describe "Git::Wrapper.command" do
    describe "when output has multiple lines" do
      it "returns system call output chomped and striped" do
        output = "  test_dir\nbananas\nanother-thing\n"
        @system_git = StoryBranch::Git::WrapperMock.new(output)

        StoryBranch::Git::Wrapper.stub(:new, @system_git) do
          res = StoryBranch::Git::Wrapper.command("branch", "-a")
          assert_equal "test_dir\nbananas\nanother-thing", res
        end
      end
    end

    describe "when the output has one line" do
      it "returns system call output chomped and striped" do
        output = "   test_dir\n"
        @system_git = StoryBranch::Git::WrapperMock.new(output)

        StoryBranch::Git::Wrapper.stub(:new, @system_git) do
          res = StoryBranch::Git::Wrapper.command("branch", "-a")
          assert_equal "test_dir", res
        end
      end
    end
  end

  describe "Git::Wrapper.command_lines" do
    describe "when output has multiple lines" do
      it "returns system call output in an array chomped and striped" do
        output = "  test_dir\n   bananas\n   another-thing\n"
        @system_git = StoryBranch::Git::WrapperMock.new(output)

        StoryBranch::Git::Wrapper.stub(:new, @system_git) do
          res = StoryBranch::Git::Wrapper.command_lines("branch", "-a")
          assert_equal %w[test_dir bananas another-thing], res
        end
      end
    end

    describe "when the output has one line" do
      it "returns system call output chomped and striped" do
        output = "   test_dir\n"
        @system_git = StoryBranch::Git::WrapperMock.new(output)

        StoryBranch::Git::Wrapper.stub(:new, @system_git) do
          res = StoryBranch::Git::Wrapper.command_lines("branch", "-a")
          assert_equal ["test_dir"], res
        end
      end
    end
  end
end
