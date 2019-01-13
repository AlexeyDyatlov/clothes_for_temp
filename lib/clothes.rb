class Clothes
  attr_reader :name, :type, :t_range
  def self.from_file(file_path)
    @file = File.readlines(file_path, chomp:true)
    temp_min, temp_max = @file[2].delete('(),').split.map(&:to_i)
    @t_range = temp_min..temp_max
    new(@file[0], @file[1], @t_range)
  end

  def initialize(name, type, t_range)
    @name = name
    @type = type
    @t_range = t_range
  end

  def for_temp?(temperature)
    @t_range.include?(temperature)
  end

  def to_s
    "#{@name} (#{@type}) - #{@t_range}"
  end
end
