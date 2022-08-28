# frozen_string_literal: true
# This comment is just here to check that the regex detecting `class Post` can handle an extra comment

# Same with the space above, this line and then the extra newlines below plus the require:

require "conventional_extensions/version"

class Post
  load_extension :named
  named :from_mailroom

  def mailroom
    "mailroom"
  end
end
