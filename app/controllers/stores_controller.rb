# frozen_string_literal: true

class StoresController < ApplicationController
  def index
    category = params[:category].presence || 0
    # categories_options = Store.where(category: category)
    @products = params[:filter] ? Store.where(category:) : Store.all
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

  def list_by_category
    @category = params[:category]
    @filter = Store.where(category: @category)
  end

  private

  def store_params
    params.require(:store).permit(:price, :category, :weight_volume, :unit_value)
  end
end
