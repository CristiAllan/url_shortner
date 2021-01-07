class Url < ApplicationRecord
  ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.split(//).freeze

  validates :original_url, presence: true
  validates :original_url, :shortner_url, uniqueness: true

  after_create :set_shortner_url

  private

  def set_shortner_url
    index = id * 1_000_000
    return ALPHABET[0] if index.zero?

    s = ''
    base = ALPHABET.length
    while index.positive?
      s << ALPHABET[index.modulo(base)]
      index /= base
    end
    self.shortner_url = "bluecoding.com/#{s.reverse}"
    self.save
  end
end
