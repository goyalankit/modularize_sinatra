require 'spec_helper'

describe  <%= module_name %>::Controllers::<%= controller_module_name %> do	
  def app
    <%= module_name %>::Controllers::<%= controller_module_name %>
  end

  it "should do nothing" do
    get '/'
    last_response.status.should == 200
  end
end


