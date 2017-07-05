module Placeholder
  extend ActiveSupport::Concern
  
  def self.image_generator(height:, width:)
    "https://placeholdit.co//i/#{height}x#{width}?"
  end
end
