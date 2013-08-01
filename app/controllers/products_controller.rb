class ProductsController < ApplicationController
  respond_to :json, :except => :export
  respond_to :xml, :only => :export

  before_filter :authenticate, :except => :export
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.all_cached_asc_name
    respond_with @products
    #atribui tanto etag quanto last-modified
    fresh_when :etag => @products, :public => true
  end

  def export
    @products = Product.all_cached_asc_updated_at.to_xml(:except => [:id, :category_id], :methods => :category_name)
    render :xml => @products
    #atribui tanto etag quanto last-modified
    fresh_when :etag => @products, :public => true
  end

  # GET /products/1
  # GET /products/1.json
  def show
    respond_with Product.find(params[:id])
    #cache no browser maior para o show
    expires_in 1.minute
    #atribui tanto etag quanto last-modified
    fresh_when @product, :public => true
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
