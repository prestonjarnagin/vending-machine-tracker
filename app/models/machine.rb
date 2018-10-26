class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :snack_machines
  has_many :snacks, through: :snack_machines


  def average_price
    found_snacks = Snack.where(id: snacks.ids)
    found_snacks.average(:price).to_f
  end
end
