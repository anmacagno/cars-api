# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Brands' do
  describe 'GET /api/v1/brands' do
    it 'returns http status ok' do
      get api_v1_brands_path, as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /api/v1/brands' do
    it 'returns http status ok' do
      post api_v1_brands_path(brand: { name: 'Audi' }), as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'creates the brand' do
      expect do
        post api_v1_brands_path(brand: { name: 'Audi' }), as: :json
      end.to change(Brand, :count).by(1)
    end
  end
end
