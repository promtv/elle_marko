require 'rails_helper'

RSpec.describe "ClothingsControllers", type: :request do
  describe "GET /clothings" do
    it "проверка роутов" do
      get "/clothings"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(%(<a href="#{t_shirts_clothings_path}"))
    end
  end
end
