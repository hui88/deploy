class StoreController < ApplicationController
  before_filter :authenticate_user!,:except => [:show,:index,:search,:group,:type,:all_product,:all_shop]
  def index
    @products= Product.all
    @group = Group.first
    @types = @group.types
    @type_ids = @types.collect &:id
    @products = Product.all(:conditions => ["type_id in (?)",@type_ids])

    @group1 = Group.find(2)
    @types1 = @group1.types
    @type_ids1 = @types1.collect &:id
    @products1 = Product.all(:conditions => ["type_id in (?)",@type_ids1])
    
   # session[:cart]=nil
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart 
    @cart = find_cart
    @product = Product.find(params[:id])
    product = Product.find(params[:id])
    @user= User.find(product.user_id)
    @cart.add_item(:product => product)
    redirect_to :action => :cart
#    respond_to do |format|
 #     format.html{redirect_to(user_products_path(params[:user_id]))}
  #    format.xml{head:ok}
  #  end
  end  

  def minus_from_cart
    @cart = find_cart
    @product = Product.find(params[:id])
    product = Product.find(params[:id])
    @cart.minus_item(:product => product)
    redirect_to :action => :cart
  end

  def delete_from_cart
    @cart = find_cart
    @product = Product.find(params[:id])
    product = Product.find(params[:id])
    @cart.delete_item(:product => product)
    redirect_to :action => :cart
  end

  def cart
    @cart = find_cart
  end

  def empty_cart
    session[:cart]=nil
    redirect_to_index("Your cart is currently empty!")
  end 
  
  def checkout
    @cart =find_cart
    if @cart.items.empty?
      redirect_to_index("You Cart is empty!")
    else
       @order = Order.new
    end  
  end

  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to_index("Thank you for your order" )
    else
      render :action => :checkout
    end
  end
  
  def done

  end
  
  def search
    @products=Product.find(:all,:conditions=>["title like ?","%#{params[:product][:title]}%"])
 
    #render :action => :search
  end


  def group
    @group = Group.find(params[:group_id])
    @types = @group.types
    @type_ids = @types.collect &:id
    @products = Product.all(:conditions => ["type_id in (?)",@type_ids])
    @products = @products.paginate(
      :page => params[:page],
      :per_page => 8 
    )
  end

  def type
    @type = Type.find(params[:type_id])
    @products = @type.products
    @products = @products.paginate(
      :page => params[:page],
      :per_page => 8
    )
  end

  def all_product
    @products=Product.all  
    @products = @products.paginate(
      :page => params[:page],
      :per_page => 8
    )
  end

  def all_shop
    @users=User.all

  end 

  private

  def find_cart
    session[:cart] ||= Cart.new
  end
  
  def redirect_to_index(msg)
    flash[:notice]=msg
    redirect_to :action => :done
  end

end
