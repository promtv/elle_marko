require 'rails_helper'

RSpec.describe Clothings, type: :model do
  subject do described_class.new(
    classification: "t-shirts",
    brand: "underarmour. ",
    name: "Polo UA Matchplay  ",
    price: "40",
    material: "94 % polyester / 6 % élasthanne",
    size: "XL,M,L",
    for_whom: "for_men"
  )
end
  context 'volidation params valid' do
    it 'is all attributes valid' do
      expect(subject).to be_valid
    end
  end

  context 'volidation price are negativ' do
    before { subject.price = -1 }

    it 'is some attridutes not valid' do
      expect(subject).not_to be_valid
    end
  end
end
