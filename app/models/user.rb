require "paperclip"
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  has_attached_file :image, :styles => { :big => "400x400>", :small => "151x179>" }

  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
  has_many :products
  has_many :orders
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role, :email, :password, :password_confirmation,:name,:sex,:QQ,:phone,:address,:title,:image,:image_file_name
  attr_accessor :image_file_name
  SEX_TYPE = [
    # Displayed stored in db
    [ "Man" , "man" ],
    [ "Woman" , "woman" ],
  ]
  ROLE_TYPE = [
    ["Member","member"],
    ["Admin","admin"],
  ]
  
end
