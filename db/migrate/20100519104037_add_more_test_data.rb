class AddMoreTestData < ActiveRecord::Migration
  def self.up
    g1 = Group.create(:name => "二手书籍")
    g2 = Group.create(:name => "电子产品")
    Group.create(:name => "服饰")
    Group.create(:name => "食品")
    Group.create(:name => "数码／手机")
    Group.create(:name => "文体／休闲")
    Group.create(:name => "图书音像")
    Type.create(:name => "计算机", :group_id => g1.id)
    Type.create(:name => "科学",   :group_id => g1.id)
    Type.create(:name => "文学",   :group_id => g1.id)
    Type.create(:name => "mp3", :group_id => g2.id)
    Type.create(:name => "mp4",   :group_id => g2.id)
    Type.create(:name => "电脑",   :group_id => g2.id)
    User.create(:name => "gao", :sex => "man", :QQ => 306671164, :phone => 13428063965, 
                :address => "五栋201A", :role => "member", :email => "123@gmail.com", 
                :password => "123123", :password_confirmation => "123123")
  end

  def self.down
  end
end
