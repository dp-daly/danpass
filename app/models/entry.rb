class Entry < ApplicationRecord
  belongs_to :user

  validates :name, :username, :password, presence: true
  validate :url_must_be_valid

  encrypts :username, deterministic: true # allows us to query against our username once encrypted
  encrypts :password

private

  def url_must_be_valid
    unless url.include?("http" || "https")
      errors.add(:url, "must be valid")
    end
  end
end
