def self.named(key)
  define_method(:named_something) { key }
end

def self.thawed_boi
  "thawed boi"
end
