require 'rails_helper'

describe 'Homepage' do
  describe 'navigate' do
    it '200 OK' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end
