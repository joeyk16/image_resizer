# frozen_string_literal: true

module Api
  module V1
    class ImageResizerController < ApiController
      def create
        image_resizer = ResizeImage.new(image_params).tap(&:call)

        if image_resizer.errors.none?
          render json: image_resizer.url
        else
          render json: { errors: image_resizer.errors.to_sentence }, status: :bad_request
        end
      end

      private

      def image_params
        params.require(:image).permit(:url, :width, :height)
      end
    end
  end
end
