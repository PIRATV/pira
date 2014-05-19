require 'spec_helper'

describe 'Sites', :type => :request do
  describe 'GET /' do
    it "should have <meta name='keywords'>" do
      visit '/'
      assert page.body.include?('<meta name="keywords"')
    end
    it "should have <meta name='description'>" do
      visit '/'
      assert page.body.include?('<meta name="description"')
    end
  end
end
