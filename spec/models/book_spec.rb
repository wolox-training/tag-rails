# frozen_string_literal: true

require 'rails_helper'

describe Book do
  subject(:book) { FactoryBot.create(:book) }

  it { is_expected.to be_valid }
  it { should validate_presence_of(:genre) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:editor) }
  it { should validate_presence_of(:year) }
end
