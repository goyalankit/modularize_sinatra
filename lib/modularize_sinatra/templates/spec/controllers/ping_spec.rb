require 'spec_helper'

describe  <%= module_name %>::Controllers::Ping do	
  def app
    <%= module_name %>::Controllers::Ping
  end

    describe "get /ping" do
      it "should return 200" do
        get :ping
        expect(last_response.body).to eq("Ahoy! from <%= module_name %> #{Time.now}")
        expect(last_response.status).to eq(200)
      end
    end
end

