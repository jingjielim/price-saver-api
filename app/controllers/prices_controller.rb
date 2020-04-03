# frozen_string_literal: true

class PricesController < ProtectedController
  before_action :set_price, only: %i[update destroy]

  # GET /prices
  def index
    result = []
    stores = current_user.stores.order(:created_at).all
    @prices = current_user.prices.all
    if @prices.length.positive?
      current_user.prices.group_by(&:item_id).each do |item_id, prices|
        record = {}
        record[:name] = Item.find(item_id).name
        record[:lowest] = { store: '', value: '' }
        record[:stores] = {}
        stores.each { |store| record[:stores][store.name] = { store_id: store.id, price_id: '', value: '-' } }
        prices.each do |price|
          store = Store.find(price.store_id)
          record[:stores][store.name] = { store_id: price.store_id, price_id: price.id, value: price.value }
        end
        result.append(record)
      end
      render json: { "prices": result }
    else
      render json: { "prices": [] }
    end
  end

  # GET /prices/1
  def show
    render json: Price.find([params[:id]])
  end

  # POST /prices
  def create
    params = price_params
    params['item_id'] =  get_item_id(params['item_name'].downcase.titlecase)
    params['store_id'] = get_store_id(params['store_name'])
    params.delete('store_name')
    params.delete('item_name')
    params.delete('item_unit')

    @price = current_user.prices.build(params)
    if @price.save
      render json: @price, status: :created, location: @price
    elsif @price.errors[:store_id][0] == 'Combination of store and item exists'
      @price = current_user.prices.find_by store_id: params['store_id'], item_id: params['item_id']
      if @price.update(params)
        render json: @price
      else
        render json: @price.errors, status: :unprocessable_entity
      end
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prices/1
  def update
    params = price_params
    if !params['item_name'].nil?
      params['item_id'] = get_item_id(params['item_name'], params['item_unit'])
      params.delete('item_name')
      params.delete('item_unit')
    end

    if !params['store_name'].nil?
      params['store_id'] = get_store_id(params['store_name'])
      params.delete('store_name')
    end

    if @price.update(params)
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

  def get_item_id(name)
    @item = current_user.items.find_by name: name

    if @item.nil?
      'Not found'
    else
      @item.id
    end
  end

  def get_store_id(name)
    @store = current_user.stores.find_by name: name

    if @store.nil?
      'Not found'
    else
      @store.id
    end
  end
end
