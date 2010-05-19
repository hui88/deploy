class Type < ActiveRecord::Base
  has_many :products
  TYPES = Type.all.map{|t|[t.name,t.id]}
end
