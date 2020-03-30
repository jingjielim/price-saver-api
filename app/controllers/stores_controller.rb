# frozen_string_literal: true

class StoresController < ProtectedController
  before_action :set_store, only: %i[update destroy]

  # GET /stores
  def index
    @stores = current_user.stores.all

    render json: @stores
  end

  # GET /stores/1
  def show
    render json: Store.find(params[:id])
  end

  # POST /stores
  def create
    @store = current_user.stores.build(store_params)

    if @store.save
      render json: @store, status: :created, location: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stores/1
  def update
    if @store.update(store_params)
      render json: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stores/1
  def destroy
    @store.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = current_user.stores.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def store_params
    params.require(:store).permit(:name)
  end
end
