# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Brands::Models' do
  describe 'GET /api/v1/brands/:id/models' do
    let(:brand) { create(:brand, name: 'Audi') }

    it 'returns http status ok' do
      get api_v1_brands_models_path(id: brand.id), as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /api/v1/brands/:id/models' do
    let(:brand) { create(:brand, name: 'Audi') }

    it 'returns http status ok' do
      post api_v1_brands_models_path(id: brand.id, model: { name: 'A1', average_price: 260_696 }), as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'creates the model' do
      expect do
        post api_v1_brands_models_path(id: brand.id, model: { name: 'A1', average_price: 260_696 }), as: :json
      end.to change(Model, :count).by(1)
    end
  end
end
