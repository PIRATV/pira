require 'spec_helper'

describe "Services", :type => :request do
  describe 'GET /Продукция' do
    it 'should have ul.breadcrumbs' do
      visit '/production'
      expect(page).to have_selector('ul.breadcrumb')
    end
  end
end
