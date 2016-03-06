class NumberInRangeByTime
  def self.integer(seed_value:, range:, unit_duration:)
    ((seed_value % (range.to_a.length * unit_duration)) / unit_duration) + range.first
  end
end
