require 'spec_helper'

describe Sinistaller do

  it "should be alive" do
    get '/'
    expect(last_response.status).to eql(200)
    expect(last_response.body).not_to be_empty
  end
end