class ClothesCollection
  def self.from_dir(path)
    clothing_units = []
    file_path = Dir.glob("#{path}/data/*.txt")
    file_path.each do |file|
      clothing_unit = Clothes.from_file(file)
      clothing_units << clothing_unit
    end
    new(clothing_units)
  end

  def initialize(clothing_units)
    @clothing_units = clothing_units
  end

  def what_to_wear(temp)
    fits_clothes = @clothing_units.select { |item| item.for_temp?(temp) }
    fits_to_wear = fits_clothes.shuffle.uniq { |item| item.type }
    fits_to_wear
  end
end
