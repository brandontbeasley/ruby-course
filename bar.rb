require 'time' # you're gonna need it

class Bar
  attr_reader :name
  attr_accessor :menu_items, :happy_discount

  def initialize(name)
    @name = name
    @menu_items = []
    @happy_discount = 0
  end

  def add_menu_item(item, price)
    @menu_items << Item.new(item, price)
  end

 def happy_discount
    if happy_hour? == false
      0
    else
      if @happy_discount >= 1
        1
      elsif @happy_discount <= 0
        0
      else
        @happy_discount
      end
    end
  end


  def happy_hour?
      if Time.now.hour == 15
        true
     else
        false
      end
  end

  def get_price(drink)
    @menu_items.each { |item|
      if item.name = drink
        return item.price * (1 - happy_discount/1)
      end
    }
  end

end

class Item
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

end
