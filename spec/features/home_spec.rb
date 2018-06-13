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

  describe "User Homepage" do
    it "allows user to confirm no overtime on audit logs" do
      user = create(:user)
      audit = create(:audit_log, user_id: user.id)
      login_as(user, scope: :user)
      visit root_path
      click_on("confirmed_#{audit.id}")
      expect(audit.reload.status).to eql("confirmed")
    end
  end

end
