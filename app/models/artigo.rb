class Artigo < ApplicationRecord
	validates :titulo, presence: true
      validates :corpo, presence: true
end
