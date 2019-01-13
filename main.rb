require_relative 'lib/clothes'
require_relative 'lib/clothes_collection'
current_path = __dir__
a = ClothesCollection.from_dir(current_path)

puts "какая температура?"
temp = STDIN.gets.to_i

select_clothes = a.what_to_wear(temp)
puts select_clothes
