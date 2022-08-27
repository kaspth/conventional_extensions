# frozen_string_literal: true

class Post
  load_extension :named
  named :from_mailroom

  def mailroom
    "mailroom"
  end
end
