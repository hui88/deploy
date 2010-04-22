class Product < ActiveRecord::Base
  def self.price_less_than_10
    Product.find(:conditions =>["price <= 10"]) 
  end
  
  def self.price_more_than_100
    Product.find(:all,:conditions =>["price >= 100"]) 
  end
  def self.price_atless_100
    Product.find(:all,:conditions =>["price <= 100"]) 
  end
end
