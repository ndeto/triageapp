require 'spec_helper'


RSpec.describe Patient, :type => :request do
  include Rack::Test::Methods  #<---- you really need this mixin

  def app
    Sinatra::Application
  end

  describe "validations" do
    it "returns all patients" do

      get '/patients'

      expect(last_response.status).to eq 200
    end
  end
end
