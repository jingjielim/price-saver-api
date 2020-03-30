# frozen_string_literal: true

class PricesController < ProtectedController
  before_action :set_price, only: %i[update destroy]

  # GET /prices
  def index
    @prices = current_user.prices.all

    render json: @prices
  end

  # GET /prices/1
  def show
    render json: Price.find([params[:id]])
  end

  # POST /prices
  def create
    params = price_params
    params['item_id'] = get_item_id(params['item_name'], params['item_unit'])
    params['store_id'] = get_store_id(params['store_name'])
    params.delete('store_name')
    params.delete('item_name')
    params.delete('item_unit')

    @price = current_user.prices.build(params)
    if @price.save
      render json: @price, status: :created, location: @price
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prices/1
  def update
    if @price.update(price_params)
      render json: @price
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prices/1
  def destroy
    @price.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_price
    @price = current_user.prices.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def price_params
    params.require(:price).permit(:value, :item_name, :item_unit, :store_name)
  end

  def get_item_id(name, unit)
    @item = current_user.items.find_by name: name
    if @item.nil?
      @item = current_user.items.build(
        name: name,
        unit: unit
      )
      if @item.save
        @item.id
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    else
      @item.id
    end
  end

  def get_store_id(name)
    @store = current_user.stores.find_by name: name
    if @store.nil?
      @store = current_user.stores.build(
        name: name
      )
      if @store.save
        @store.id
      else
        render json: @store.errors, status: :unprocessable_entity
      end
    else
      @store.id
    end
  end
end
