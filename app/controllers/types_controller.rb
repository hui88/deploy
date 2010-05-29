class TypesController < ApplicationController
  # GET /types
  # GET /types.xml
  def index
    @user = User.find(current_user.id)
    @group = Group.find(params[:group_id])
    @types = @group.types
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @types }
    end
  end

  # GET /types/1
  # GET /types/1.xml
  def show
    @user = User.find(current_user.id)
    @group = Group.find(@typ.group.id)
    @type = Type.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @type }
    end
  end

  # GET /types/new
  # GET /types/new.xml
  def new
    @type = Type.new
    @user = User.find(current_user.id)
    @group_id = params[:group_id]
    @group = Group.find(params[:group_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @type }
    end
  end

  # GET /types/1/edit
  def edit
    @type = Type.find(params[:id])
    @user = User.find(current_user.id)
    @group_id = params[:group_id]
    @group =Group.find(params[:group_id])    
  end

  # POST /types
  # POST /types.xml
  def create
    @type = Type.new(params[:type])
    @user = User.find(current_user.id)
    @group = Group.find(@type.group_id)
    respond_to do |format|
      if @type.save
        flash[:notice] = 'Type was successfully created.'
        format.html { redirect_to(group_types_path(@group.id)) }
        format.xml  { render :xml => @type, :status => :created, :location => @type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /types/1
  # PUT /types/1.xml
  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        flash[:notice] = 'Type was successfully updated.'
        format.html { redirect_to(group_types_path(@type.group_id))}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.xml
  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to(group_types_path(@type.group_id)) }
      format.xml  { head :ok }
    end
  end
end
