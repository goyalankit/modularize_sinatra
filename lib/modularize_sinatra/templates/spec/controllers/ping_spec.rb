require 'spec_helper'

describe  <%= module_name %>::Controllers::Ping do	
  def app
    <%= module_name %>::Controllers::Ping
  end

    describe "get /ping" do
      it "should return 200" do
        get :ping
        last_response.body.should == "Ahoy! from <%= module_name %> #{Time.now}"
        last_response.status.should == 200
      end
    end
end

