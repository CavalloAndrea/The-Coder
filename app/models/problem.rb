class Problem < ActiveRecord::Base
	validates :titolo, presence: true
    validates :esercizio, presence: true
    validates :soluzione, presence: true
    belongs_to :user
end

