class BlogpostsController < ApplicationController

  http_basic_authenticate_with :name => "bearshotgun", :password => "bearsrul3", :except => [:index, :show]

  # GET /blogposts
  # GET /blogposts.json
  def index
    @blogposts = Blogpost.paginate(page: params[:page], :per_page => 5, :order => "created_at DESC")
    @blogpost_by_month = Blogpost.find(:all, :order => "created_at DESC").group_by { |post| post.created_at.beginning_of_month }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogposts }
    end
  end

  def admin_index
    @blogposts = Blogpost.all(:order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogposts }
    end
  end

  # GET /blogposts/1
  # GET /blogposts/1.json
  def show
    @blogpost = Blogpost.find(params[:id])
    @blogpost_by_month = Blogpost.find(:all, :order => "created_at DESC").group_by { |post| post.created_at.beginning_of_month }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blogpost }
    end
  end

  # GET /blogposts/new
  # GET /blogposts/new.json
  def new
    @blogpost = Blogpost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blogpost }
    end
  end

  # GET /blogposts/1/edit
  def edit
    @blogpost = Blogpost.find(params[:id])
  end

  # POST /blogposts
  # POST /blogposts.json
  def create
    @blogpost = Blogpost.new(params[:blogpost])

    respond_to do |format|
      if @blogpost.save
        format.html { redirect_to @blogpost, notice: 'Blogpost was successfully created.' }
        format.json { render json: @blogpost, status: :created, location: @blogpost }
      else
        format.html { render action: "new" }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blogposts/1
  # PUT /blogposts/1.json
  def update
    @blogpost = Blogpost.find(params[:id])

    respond_to do |format|
      if @blogpost.update_attributes(params[:blogpost])
        format.html { redirect_to @blogpost, notice: 'Blogpost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogposts/1
  # DELETE /blogposts/1.json
  def destroy
    @blogpost = Blogpost.find(params[:id])
    @blogpost.destroy

    respond_to do |format|
      format.html { redirect_to blogposts_url }
      format.json { head :no_content }
    end
  end
end