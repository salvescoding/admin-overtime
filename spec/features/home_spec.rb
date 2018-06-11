require 'rails_helper'

describe 'Homepage' do
  describe 'navigate' do
    it '200 OK' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
  describe "Admin Homepage" do
    it "allows admin to approve from homepage" do
      admin = create(:admin_user)
      post = create(:post)
      login_as(admin, scope: :user)
      visit root_path
      click_on("approved_#{post.id}")
      expect(post.reload.status).to eql("approved")
    end

  end

end
