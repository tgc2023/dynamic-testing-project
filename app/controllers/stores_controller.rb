# frozen_string_literal: true

class StoresController < ApplicationController
  def index
    @products = Store.all
    respond_to do |format|
      format.html
    end
  end

  def new
    @new_product = Store.new
  end

  def create
    @product = Store.new(store_params)
    if @product.save
      redirect_to '/stores/new', notice: I18n.t('store.post')
    else
      redirect_to '/stores/new', notice: @product.errors.messages
    end
  end

  def update
    if @product.update(store_params)
      redirect_to stores_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to stores_path
  end

  def list_by_category
    @category = params[:category]
    @filter = Store.where(category: @category)
  end

  private

  def set_store
    @product = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:price, :category, :weight_volume, :unit_value)
  end
end
