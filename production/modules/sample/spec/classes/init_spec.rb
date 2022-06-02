require 'spec_helper'
describe 'sample' do
  context 'with default values for all parameters' do
    it { should contain_class('sample') }
  end
end
