class ProductsController < ApplicationController
  layout "application"
  # GET /products
  # GET /products.xml
  before_filter :load_cart
  def index
    @cart = find_cart
    #@user_products = Product.find_all_by_user_id(params[:user_id])
    @user = User.find(params[:user_id]) 
    @user_products = @user.products
    #@user_products2 = User.find(params[:user_id]).products
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    @user = @product.user

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xm;l
  def new
    @product = Product.new
    @user_id = params[:user_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save#index.html.erb
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to(user_product_path(@product.user_id,@product.id)) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(user_products_path(@product.user_id)) }
      format.xml  { head :ok }
    end
  end

  def add_to_cart 
    @cart = find_cart
    product = Product.find(params[:id])
    @cart.add_item(:product => product)
    respond_to do |format|
      format.html{redirect_to(user_products_path(params[:user_id]))}
      format.xml{head:ok}
    end
  end  

  def test
    @test = "hello" 
    render "test"
  end

  def find_cart
    session[:cart] ||= Cart.new
  end

  def load_cart
    @cart = find_cart
  end  
  
  def search
    
    
  end

end
