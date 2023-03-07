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
end
