class Article < ApplicationRecord
	validates :name, presence:true, uniqueness:true, length: {minimum:5,maximum:30}
	validates :discription,presence:true,length: {minimum:6,maximum:100}

end