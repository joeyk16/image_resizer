# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    after(:build) do |image|
      image.file.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'cat.jpg')),
        filename: 'cat.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end
end
