class Client < ApplicationRecord
    has_many :pets, dependent: :destroy
    def petCounts
        self.pets.count
    end
end
