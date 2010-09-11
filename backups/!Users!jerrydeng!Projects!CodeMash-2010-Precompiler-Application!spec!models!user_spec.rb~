require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory.create(:user, :role => 'some_role')
  end

  it 'can assign one role' do
    @user.role.should == 'some_role'
  end
  
  it 'determines if the user has a role' do
    @user.has_role?('some_role').should be_true
  end
end