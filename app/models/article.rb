class Article < ApplicationRecord
	belongs_to :user
	has_many :article_categories
    has_many :categories, through: :article_categories
	validates :name, presence:true, uniqueness:true, length: {minimum:5,maximum:30}
	validates :discription,presence:true,length: {minimum:6,maximum:100}
	validates :user_id, presence:true

end