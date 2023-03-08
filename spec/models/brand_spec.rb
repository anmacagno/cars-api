# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Brand do
  describe 'associations' do
    it { is_expected.to have_many(:models) }
  end

  describe 'validations' do
    subject { build(:brand) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end

  describe '#average_price' do
    subject(:brand) { create(:brand) }

    context 'when the brand has models' do
      before do
        create(:model, brand:, name: 'F-150', average_price: 268_727)
        create(:model, brand:, name: 'F-250', average_price: 201_785)
        create(:model, brand:, name: 'F-350', average_price: 287_341)
        create(:model, brand:, name: 'F-450', average_price: nil)
        create(:model, brand:, name: 'F-550', average_price: nil)
      end

      it 'returns the correct average price' do
        expect(brand.average_price).to eq(252_617)
      end
    end

    context 'when the brand does not have models' do
      it 'returns 0' do
        expect(brand.average_price).to eq(0)
      end
    end
  end
end
