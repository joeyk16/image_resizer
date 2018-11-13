# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Image Resizer', type: :request do
  subject(:res_body) { JSON.parse(response.body, symbolize_names: true) }

  describe '#create' do
    context 'when valid params' do
      let(:valid_params) do
        {
          image: {
            url: ActionController::Base.helpers.asset_url('cat.jpg'),
            width: 300,
            height: 200
          }
        }
      end

      before do
        allow_any_instance_of(MiniMagick::Image).to receive(:open).and_return(nil)
      end

      it 'response' do
        expect do
          post '/api/v1/resize', params: valid_params
        end.to change { Image.count }.by(1)

        expect(response.body).to include('http://localhost:3000/rails/active_storage/blobs/')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when invalid params' do
      let(:invalid_params) do
        {
          image: {
            url: 'www.invalid_url.com/image.jpg'
          }
        }
      end

      it 'response' do
        expect do
          post '/api/v1/resize', params: invalid_params
        end.to change { Image.count }.by(0)

        expect(res_body).to eq(
          errors: 'No such file or directory @ rb_sysopen - www.invalid_url.com/image.jpg'
        )
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
