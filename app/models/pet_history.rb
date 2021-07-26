class PetHistory < ApplicationRecord
    belongs_to :pet
    def petName
        self.pet.name
    end
end
