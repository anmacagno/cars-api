# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Model do
  describe 'associations' do
    it { is_expected.to belong_to(:brand) }
  end

  describe 'validations' do
    subject { build(:model) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive.scoped_to(:brand_id) }
  end
end
