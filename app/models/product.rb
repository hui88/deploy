require "paperclip"
class Product < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  belongs_to :types
  # validation stuff...

  has_attached_file :image, :styles => { :big => "400x400>", :small => "151x179>" }




  validates_presence_of :title, :description 


  validates_numericality_of :price


  validate :price_must_be_at_least_a_cent


  validates_uniqueness_of :title

  def order_items
    line_items
  end

protected
  def price_must_be_at_least_a_cent
    errors.add(:price, 'should be at least 0.01') if price.nil? ||
                       price < 0.01
  end

end
