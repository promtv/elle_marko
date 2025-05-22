require 'rails_helper'  # Подключает конфигурацию RSpec для тестирования Rails-приложения

RSpec.describe Clothing, type: :model do  # Определяет блок тестов для модели Clothing
  # Создаем "subject" — объект Clothing с валидными атрибутами, который будем тестировать
  subject do
    described_class.new(  # described_class — это Clothing
      classification: "t-shirts",
      brand: "underarmour",
      name: "Polo UA Matchplay",
      price: 40,
      material: "94% polyester / 6% elastane",
      size: "XL,M,L",
      for_whom: "for_men"
    )
  end

  context 'with valid attributes' do  # Группа тестов для валидных атрибутов
    it 'is valid' do               # Описывает конкретный тест: объект должен быть валидным
      expect(subject).to be_valid  # Проверка: объект Clothing валиден (проходит валидации)
    end
  end

  context 'with negative price' do  # Группа тестов для случая с отрицательной ценой
    it 'is not valid' do            # Описывает тест: объект не должен быть валидным
      subject.price = -1            # Меняем цену на отрицательную
      expect(subject).not_to be_valid  # Проверяем, что объект теперь НЕ валиден
    end
  end
end
