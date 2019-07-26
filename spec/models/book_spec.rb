# frozen_string_literal: true

require 'rails_helper'

describe Book do
  required_fields = %i[genre author image title editor year]

  context 'with correctly typed required fields' do
    subject { build(:book) }

    it { is_expected.to be_valid }

    required_fields.each do |field|
      it { is_expected.to validate_presence_of(field) }
    end

    it 'should save correctly' do
      expect(subject.save).to be true
    end
  end

  required_fields.each do |field|
    context "with missing #{field}" do
      subject { build(:book, field => nil) }

      it { is_expected.to_not be_valid }

      it 'should not be save' do
        expect(subject.save).to_not be true
      end
    end
  end
end
