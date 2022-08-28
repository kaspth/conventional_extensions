class SomeSuperclass
end

class Post < SomeSuperclass
  load_extensions

  named :from_post

  class Comment
    load_extensions
  end
end
