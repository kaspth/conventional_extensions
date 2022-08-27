def self.named(key)
  define_method(:named_something) { key }
end
