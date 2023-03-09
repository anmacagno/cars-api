# frozen_string_literal: true

class Api::V1::ModelsController < ApplicationController
  before_action :set_model, only: %i[update]

  def index
    @models = Model.all
                   .average_price_greater_than(search_params[:greater])
                   .average_price_lower_than(search_params[:lower])
  end

  def update
    @model.update!(model_params)
  end

  private

  def set_model
    @model = Model.find(params[:id])
  end

  def search_params
    params.permit(:greater, :lower)
  end

  def model_params
    params.require(:model).permit(:average_price)
  end
end
