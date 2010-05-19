class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  
  PAYMENT_TYPES = [
    # Displayed stored in db
    [ "Check" , "check" ],
    [ "Credit card" , "cc" ],
    [ "Purchase order" , "po" ]
  ]

  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li
    end
  end

  def add_user_message(user)
    order.user_id = user.id
  end  
    
end
