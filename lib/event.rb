class Event

  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.check_stock(item) > 0
    end
  end

  def total_inventory
    result = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        summed_quantity = food_trucks_that_sell(item).sum do |truck|
          truck.check_stock(item)
        end
        result[item] = {quantity: summed_quantity, food_trucks: food_trucks_that_sell(item)}
      end
    end
    result
  end

end
