# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Models' do
  describe 'GET /api/v1/models' do
    it 'returns http status ok' do
      get api_v1_models_path, as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /api/v1/models/:id' do
    let(:model) { create(:model, name: 'A1') }

    it 'returns http status ok' do
      put api_v1_model_path(id: model.id, model: { average_price: 260_696 }), as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'updates the model' do
      put api_v1_model_path(id: model.id, model: { average_price: 260_696 }), as: :json
      expect(response.parsed_body).to eq({ 'id' => model.id, 'name' => 'A1', 'average_price' => 260_696 })
    end
  end
end
