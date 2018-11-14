# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResizeImage do
  subject(:resize_image) { described_class.new(valid_params) }

  let(:valid_params) do
    {
      url: ActionController::Base.helpers.asset_url('cat.jpg'),
      width: 300,
      height: 200
    }
  end

  describe '#call' do
    let(:created_image) { Image.last }

    before do
      allow_any_instance_of(described_class).to receive(:resize).and_return(nil)
    end

    it 'saves image with attached file' do
      expect do
        resize_image.call
      end.to change(Image, :count).by(1)

      expect(created_image.file.attached?).to be_truthy
    end

    it 'returns resized image url' do
      expect(resize_image.call).to include(
        "#{Rails.application.secrets.asset_host}/rails/active_storage/blobs/"
      )
    end
  end
end
