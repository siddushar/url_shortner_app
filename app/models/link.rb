class Link < ApplicationRecord
  validates :original_url, presence: true
  validates_format_of :original_url, :with => URI::regexp(%w(http https))

  before_create :generate_short_url

  private

  def generate_short_url
    self.short_url = SecureRandom.hex(5)
  end
end
