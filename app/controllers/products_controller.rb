class ProductsController < ApplicationController
  respond_to :json, :except => :export
  respond_to :xml, :only => :export

  before_filter :authenticate, :except => :export
  
  # GET /products
  # GET /products.json
  def index
    respond_with Product.order('name')
  end

  def export
    render :xml => Product.order('updated_at').to_xml(:except => [:id, :category_id], :methods => :category_name)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    respond_with Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    if @product.update(params[:product])
      head :no_content
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    head :no_content
  end
  
  protected

  def authenticate
    if authenticate_with_http_basic { |u, p| u == 'dummy' && p == 'drwho'}
    else
      request_http_basic_authentication
    end
  end

end
