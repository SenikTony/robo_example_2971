class Item < ApplicationRecord
  ROBO_HOST = "www.robohash.org".freeze

  belongs_to :user, inverse_of: :items

  validates :robo_hash, presence: :true

  def url(size = "300x300")
    return "" if robo_hash.blank?

    URI::HTTPS.build(host: ROBO_HOST, path: "/#{robo_hash}.png", query: "size=#{size}").to_s
  end
end
