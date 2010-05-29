class Type < ActiveRecord::Base
  has_many :products,:dependent => :delete_all
    validates_presence_of :name
      validates_uniqueness_of :name
  TYPES = Type.all.map{|t|[t.name,t.id]}
end
