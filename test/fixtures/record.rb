class AbstractRecord
  extend ConventionalExtensions.load_on_inherited
end

class Record < AbstractRecord
end
