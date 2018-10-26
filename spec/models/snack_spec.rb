require 'rails_helper'

describe Snack, type: :model do
  describe 'validations' do
    it { should have_many :machines }.through(:snack_machines)
  end
end
