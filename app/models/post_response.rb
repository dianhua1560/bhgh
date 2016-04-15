class PostResponse < ActiveRecord::Base
	belongs_to :post
	has_many :post_response_likes, :dependent => :destroy
end
