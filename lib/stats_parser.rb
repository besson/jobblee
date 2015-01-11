class StatsParser

  def self.bubble_map(bubble_array)
    output = {}
    bubble_array.each do |bubble|
      output[bubble.name] = bubble.value
    end

    output
  end
end
