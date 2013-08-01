class CategoriesController < ApplicationController
  respond_to :json, :except => :export
  respond_to :xml, :only => :export

  before_filter :authenticate, :except => :export
  
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.full_tree_as_hash
    respond_with @categories.to_json
    fresh_when :etag => @categories, :public => true
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    respond_with @category
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    if @category.save
      respond_with @category, status: :created, location: @category
    else
      respond_with @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    if @category.update(params[:category])
      head :no_content
    else
      respond_with @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    head :no_content
  end  

end
