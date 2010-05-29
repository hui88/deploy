class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, :dependent => :delete_all
  
  validates_presence_of :pay_type
  
  PAYMENT_TYPES = [
    # Displayed stored in db
    [ "货到付款" , "货到付款" ],
    [ "网银" , "网银" ],
    [ "支付宝" , "支付宝" ]
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
