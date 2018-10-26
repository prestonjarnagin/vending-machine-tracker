class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :snacks

  def average_price
    found_snacks = Snack.where(id: snacks.ids)
    found_snacks.average(:price).to_f
  end
end
