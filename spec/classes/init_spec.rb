require 'spec_helper'
describe 'role_apache' do

  context 'with defaults for all parameters' do
    it { should contain_class('role_apache') }
  end
end
