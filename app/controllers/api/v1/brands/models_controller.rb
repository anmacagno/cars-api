# frozen_string_literal: true

class Api::V1::Brands::ModelsController < ApplicationController
  before_action :set_brand, only: %i[index create]

  def index
    @models = @brand.models
  end

  def create
    @model = @brand.models.create!(model_params)
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def model_params
    params.require(:model).permit(:name, :average_price)
  end
end
