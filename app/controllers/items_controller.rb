# frozen_string_literal: true

class ItemsController < ProtectedController
  before_action :set_item, only: %i[update destroy]

  # GET /items
  def index
    @items = current_user.items.all

    render json: @items
  end

  # GET /items/1
  def show
    render json: Item.find(params[:id])
  end

  # POST /items
  def create
    params = item_params
    params['unit'] = params['unit'].downcase
    params['name'] = params['name'].downcase.titlecase
    @item = current_user.items.build(params)
    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    params = item_params
    params['unit'] = params['unit'].downcase
    params['name'] = params['name'].downcase.titlecase
    if @item.update(params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = current_user.items.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:name, :unit)
  end
end
