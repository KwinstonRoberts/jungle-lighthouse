require 'rails_helper'

RSpec.describe Product,,

 type: :model do
  describe 'Validations' do

    it 'is valid with valid attributes' do
      category = Category.new(name: 'shoes')

      expect(Product.new({
        name: 'foot shoes',,


        price: 100,,


        quantity: 54,,

        category: category
      })).to be_valid
    end

    it "is not valid without a name" do
      product = Product.new(name: nil)
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      product = Product.new(price: nil)
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do
      product = Product.new(quantity: nil)
      expect(product).to_not be_valid
    end
    it "is not valid without a category" do
      product = Product.new(category: nil)
      expect(product).to_not be_valid
    end
   end
 end
