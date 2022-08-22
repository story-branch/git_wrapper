# frozen_string_literal: true

class StoryBranch::Git::WrapperMock < StoryBranch::Git::Wrapper
  def initialize(command_output)
    super()
    @command_output = command_output
  end

  def `(cmd)
    @command_output
  end
end
