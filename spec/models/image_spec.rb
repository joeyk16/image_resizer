# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  subject { create(:image) }

  describe '#file' do
    it 'has one file' do
      expect(subject.file).to be_an_instance_of(ActiveStorage::Attached::One)
    end
  end
end
