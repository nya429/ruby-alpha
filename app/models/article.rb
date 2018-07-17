class Article < ActiveRecord::Base
  #belongs_to take singular
  belongs_to :user
  # has_many pluralized !important
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: {minimum: 10, maxmum: 50}
  validates :description, presence: true, length: {minimum: 10, maxmum: 300}
  validates :user_id, presence: true
end
