# frozen_string_literal: true

class Api::V1::BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def create
    @brand = Brand.create!(brand_params)
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
