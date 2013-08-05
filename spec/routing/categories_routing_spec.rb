require "spec_helper"

describe CategoriesController do
  let(:url)     { "http://localhost:3000/api"     }
  describe "routing" do

    it "routes to #index" do
      get("#{url}/categories").should route_to("categories#index")
    end

    it "routes to #show" do
      get("#{url}/categories/1").should route_to("categories#show", :id => "1")
    end

    it "routes to #update" do
      put("#{url}/categories/1").should route_to("categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("#{url}/categories/1").should route_to("categories#destroy", :id => "1")
    end
    
    it "routes to #export" do
      get("#{url}/categories/tree").should route_to("categories#tree")
    end

  end
end
