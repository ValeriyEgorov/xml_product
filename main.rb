# encoding: utf-8
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end


require_relative 'lib\product.rb'
require_relative 'lib\book.rb'
require_relative 'lib\film.rb'
require_relative 'lib\disc.rb'


products = []

# products << Film.new(price: 300, ammount: 3, title: 'Леон', year: 1999, producer: 'Жак Рено')
# products << Product.new(price: 300, ammount: 3)
# products << Book.new(price: 300, ammount: 3, name: "Идиот", genre: "роман", author: "Федор Достоевский")
# products << Film.from_file('/Data/Film/01.txt')
# products << Book.from_file('/Data/Book/01.txt')
#
catalog = Product.read_from_xml(File.dirname(__FILE__) + '/lib/Data/catalog.xml')

choice = 0

total = 0

while choice != 'x'
  Product.showcase(catalog)

  choice = STDIN.gets.chomp

  if choice != 'x' && choice.to_i < catalog.size && choice.to_i >= 0
    product = catalog[choice.to_i]
    total += product.buy
  end

end

puts "Спасибо за покупки, с Вас: #{total}"




# puts catalog.size
#
# catalog.each do |item|
#   puts item.show
# end
#
# puts catalog.size


# products = Product_Collection.from_dir(File.dirname(__FILE__) + '/' + 'lib' + '/' + 'Data')
#
#  products.sort!(by: :amount)

# begin
# products << Product.from_file('/data/films/01.txt')
# rescue NotImplementedError
# puts 'Метод класса Product.from_file не реализован'
# end

# products.to_a.each do |item|
#   puts item
# end