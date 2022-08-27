$named_extension_loading_count ||= 0
$named_extension_loading_count += 1

def self.named(key)
  define_method(:"named_something_#{key}") { key }
end

def self.thawed_boi
  "thawed boi"
end
