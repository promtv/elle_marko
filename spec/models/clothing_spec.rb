require 'rails_helper'

RSpec.describe Clothing, type: :model do
  subject do
    described_class.new(
      classification: "t-shirts",
      brand: "underarmour",
      name: "Polo UA Matchplay",
      price: 40,
      material: "94% polyester / 6% elastane",
      size: "XL,M,L",
      for_whom: "for_men"
    )
  end

  context 'with valid attributes' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'with negative price' do
    it 'is not valid' do
      subject.price = -1
      expect(subject).not_to be_valid
    end
  end
end
