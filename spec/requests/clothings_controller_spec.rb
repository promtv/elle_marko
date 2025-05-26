require 'rails_helper'

RSpec.describe ClothingsController, type: :request do
  let!(:clothing) { FactoryBot.create(:clothing) }

  describe "GET /clothings" do
    it "проверка роутов" do
      get "/clothings"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(%(href="#{t_shirts_clothings_path}"))
      expect(response.body).to include(%(href="#{headwear_clothings_path}"))
      expect(response.body).to include(%(href="#{shoes_clothings_path}"))
      expect(response.body).to include(%(href="#{jackets_clothings_path}"))
      expect(response.body).to include(%(href="#{sweaters_clothings_path}"))
      expect(response.body).to include(%(href="#{business_suits_clothings_path}"))
    end
  end

  describe "GET /clothings/t_shirts" do
    it "проверка роутов" do
      get "/clothings/t_shirts"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("t_shirts")
    end
  end

  describe "GET /clothings/headwear" do
    it "проверка роутов" do
      get "/clothings/headwear"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("headwear")
    end
  end

  describe "GET /clothings/business_suits" do
    it "проверка роутов" do
      get "/clothings/business_suits"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("business_suits")
    end
  end

  describe "GET /clothings/jackets" do
    it "проверка роутов" do
      get "/clothings/jackets"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("jackets")
    end
  end

  describe "GET /clothings/sweaters" do
    it "проверка роутов" do
      get "/clothings/sweaters"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("sweaters")
    end
  end

  describe "GET /clothings/shoes" do
    it "проверка роутов" do
      get "/clothings/shoes"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("shoes")
    end
  end

  describe "POST /clothings" do
    let(:valid_attributes) do
      {
        clothing: {
          classification: "t-shirts",
          brand: "Nike",
          name: "Cool T-Shirt",
          price: 49.99,
          material: "Cotton",
          size: "M,L",
          for_whom: "for_men"
        }
      }
    end

    let(:invalid_attributes) do
      {
        clothing: {
          classification: "",
          brand: "",
          name: "",
          price: -10,
          material: "",
          size: "",
          for_whom: ""
        }
      }
    end

    context "with login as admin" do
      before do
        allow_any_instance_of(ClothingsController).to receive(:require_admin!)
      end

      context "with valid parameters" do
        it "creates a new Clothing and redirects" do
          expect {
            post "/clothings", params: valid_attributes
          }.to change(Clothing, :count).by(1)

          new_clothing = Clothing.last
          expect(response).to redirect_to(clothing_path(new_clothing))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Clothing and renders :new with 422" do
          expect {
            post "/clothings", params: invalid_attributes
          }.not_to change(Clothing, :count)

          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include("prohibited this clothing from being saved")
        end
      end
    end
  end
end
