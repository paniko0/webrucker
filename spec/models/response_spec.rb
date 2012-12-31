require 'spec_helper'

describe "Response Model" do
  let(:response) { Response.new }
  it 'can be created' do
    response.should_not be_nil
  end
end
