# frozen_string_literal: true

require 'rails_helper'

describe Book do
  let(:book) { FactoryBot.create(:book) }

  it 'is valid with required attributes' do
    expect(book).to be_valid
  end
end
