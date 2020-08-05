class Item

  attr_reader :name,
              :price
  def initialize(args)
    @name = args[:name]
    @price = args[:price].delete("$").to_f
  end
end
