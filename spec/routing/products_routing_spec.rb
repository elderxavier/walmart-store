require "spec_helper"

describe ProductsController do
  let(:url)     { "http://localhost:3000/api"     }
  describe "routing" do

    it "routes to #index" do
      get("#{url}/products").should route_to("products#index")
    end

    it "routes to #show" do
      get("#{url}/products/1").should route_to("products#show", :id => "1")
    end

    it "routes to #update" do
      put("#{url}/products/1").should route_to("products#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("#{url}/products/1").should route_to("products#destroy", :id => "1")
    end
    
    it "routes to #export" do
      get("#{url}/products/export").should route_to("products#export")
    end

  end
end
