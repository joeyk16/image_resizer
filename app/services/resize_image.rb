# frozen_string_literal: true

class ResizeImage
  attr_reader :image, :url, :errors

  def initialize(params)
    @url = params[:url]
    @width = params[:width]
    @height = params[:height]
    @resize_path = Rails.root.join('tmp', 'images', File.basename(url))
    @errors = []
  end

  def call
    resize
    save_image
    image_url
  end

  private

  attr_reader :width, :height, :resize_path

  def resize
    resize_image = MiniMagick::Image.open(url)
    resize_image.resize("#{width}x#{height}")
    resize_image.write resize_path
  rescue Errno::ENOENT => error
    @errors << error.to_s
  end

  def save_image
    return if errors.present?

    @image = Image.new
    image.file.attach(
      io: File.open(resize_path),
      filename: File.basename(url)
    )
    image.save
  end

  def image_url
    return if errors.present?

    @url = Rails.application.routes.url_helpers.url_for(@image.file)
  end
end
