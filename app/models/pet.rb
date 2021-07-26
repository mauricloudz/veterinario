class Pet < ApplicationRecord
  has_many :pet_histories, dependent: :destroy
  belongs_to :client

  def historyCount
    self.pet_histories.count    
  end

  def avgWeight
    self.pet_histories.average(:weight)
  end

  def avgHeight
    self.pet_histories.average(:heigth)
  end

  def maxWeight
    self.pet_histories.pluck(:weight).max
  end

  def maxHeight
    self.pet_histories.pluck(:heigth).max
  end

end
