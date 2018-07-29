class Tutorial < ActiveRecord::Base
	validates :titolo, presence: true
    validates :lezione, presence: true
    validates :linguaggio, presence: true
end
