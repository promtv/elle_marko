require 'rails_helper'

RSpec.describe "ClothingsControllers", type: :request do
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
end
