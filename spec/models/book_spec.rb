# frozen_string_literal: true

require 'rails_helper'

describe Book do
  required_fields = %i[genre author image title editor year]

  context 'with correctly typed required fields' do
    subject(:book) { build(:book) }

    it { is_expected.to be_valid }

    required_fields.each do |field|
      it { is_expected.to validate_presence_of(field) }
    end

    it 'saves correctly' do
      expect(book.save).to be true
    end
  end

  required_fields.each do |field|
    context "with missing #{field}" do
      subject(:book) { build(:book, field => nil) }

      it { is_expected.not_to be_valid }

      it 'is not save' do
        expect(book.save).not_to be true
      end
    end
  end
end
