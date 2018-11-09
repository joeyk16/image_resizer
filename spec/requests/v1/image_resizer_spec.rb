# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Image Resizer', type: :request do
  describe '#create' do
    context 'when valid params' do
      # post '/api/v1/resize', params: {
      #   user_ids: [attendees.first.provider_id, invalid_id],
      #   subject: email_subject,
      #   message: message
      # }
      before do
        post '/api/v1/resize'
      end

      it 'response' do
        expect(response.body).to eq('')
      end
    end
  end
end
