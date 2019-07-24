# frozen_string_literal: true

require 'rails_helper'

describe Book do
  subject(:book) { FactoryBot.create(:book) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:editor) }
  it { is_expected.to validate_presence_of(:year) }
end
