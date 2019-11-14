require 'rexml/document'
require 'date'

class Product

  def initialize(price, amount_available)
    @price = price
    @amount_available = amount_available
  end

  def update(params)

  end

  def info

  end

  def show
    "#{info} - #{@price} руб. [осталось: #{@amount_available}]"
  end

  def self.showcase(products)
    puts "Что хотите купить?\n\n"

    products.each_with_index do |product, index|
      puts "#{index}: #{product.show}"
    end

    puts "\nx. Покинуть магазин\n\n"
  end

  def buy
    if @amount_available > 0
      puts "* * *"
      puts "Вы купили товар #{info}"
      puts "* * *\n\n"

      @amount_available -= 1

      return @price
    else
      puts "К сожалению, больше нет\n\n"
    end

    return 0
  end

  def self.read_from_xml(file_name)

    abort "Извиняемся хозяин, файлик my_expenses.xml не найден." unless File.exist?(file_name)

    file = File.new(file_name, 'r:UTF-8')

    doc = REXML::Document.new(file)

    file.close

    result = []
    product = nil

    doc.elements.each("products/product") do |item|

      price = item.attributes["price"].to_i
      amount_available = item.attributes["amount_available"].to_i

      item.elements.each("book") do |book|
        product = Book.new(price, amount_available)
        product.update(
            title: book.attributes["title"],
            author_name: book.attributes["author_name"]
        )

      end

      item.elements.each("film") do |film|
        product = Film.new(price, amount_available)
        product.update(
            title: film.attributes["title"],
            genre: film.attributes["genre"],
            year: film.attributes["year"],
            producer: film.attributes["producer"]
        )

      end

      item.elements.each("disc") do |disc|
        product = Disc.new(price, amount_available)
        product.update(
            title: disc.attributes["title"],
            genre: disc.attributes["genre"],
            year: disc.attributes["year"],
            producer: disc.attributes["producer"]
        )

      end

      result.push(product)
    end

    return result

  end

end