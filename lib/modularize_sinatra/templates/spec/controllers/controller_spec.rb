require 'spec_helper'

describe  <%= module_name %>::Controllers::<%= controller_module_name %> do	
  def app
    <%= module_name %>::Controllers::<%= controller_module_name %>
  end

  it "should do nothing" do
    true.should == true
  end
end


