class Cart
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(hash)
    item = find_item(hash[:product].id)
    if !item.nil?
      item.quantity = item.quantity + 1
    else
      @items << CartItem.new(hash)
    end
  end

  def minus_item(hash)
    item = find_item(hash[:product].id)
    if item.quantity>1
      item.quantity = item.quantity - 1
    end
  end

  def delete_item(hash)
    item=find_item(hash[:product].id)
    @items.delete(item)
  
  end
  
  def find_item(product_id)
    @items.each do |x|
      return x if product_id == x.product.id
    end
    return nil
  end
  
  def total_price
    @items.sum{|item|item.price}
  end

end

class CartItem
  attr_accessor :product,:quantity
  def initialize(hash)
    @product = hash[:product]
    @quantity = 1
  end  
  def price
    @product.price * @quantity
  end  
end

