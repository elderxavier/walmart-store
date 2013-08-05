require 'spec_helper'
require 'auth_helper'

describe ProductsController do
  include AuthHelper
  it "should authenticate if correct credentials provided" do
    http_login
    get :index, :format => 'json'
    response.status.should be 200
  end
  it "should return not acceptable if format not json" do
    http_login
    get :index
    response.status.should be 406
  end
  it "should not authenticate if incorrect credentials provided" do
   http_login('dalek', 'rose')
    get :index, :format => 'json'
    response.status.should eql 401
  end
  it "should cache if etag present" do
    http_login
    get :index, :format => 'json'
    request.env['HTTP_IF_NONE_MATCH'] = response.etag
    get :index, :format => 'json'
    response.status.should be 304
  end
end
