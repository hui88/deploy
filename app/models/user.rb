require "paperclip"
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  has_attached_file :avatar, :styles => { :big => "400x400>", :small => "151x179>" }

  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
  has_many :products, :dependent => :delete_all
  has_many :orders, :dependent => :delete_all
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role, :email, :password, :password_confirmation,:name,:sex,:QQ,:phone,
                  :address,:title,:avatar,:avatar_file_name,
                  :avatar_content_type,  :avatar_file_size,:avatar_updated_at
  SEX_TYPE = [
    # Displayed stored in db
    [ "男" , "man" ],
    [ "女" , "woman" ],
  ]
  ROLE_TYPE = [
    ["会员","member"],
    ["管理员","admin"],
  ]
  
end
