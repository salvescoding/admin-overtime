require 'rails_helper'

describe 'AdminDashboard' do
  describe 'navigate' do

    it 'redirects non signed in users to sign in page' do
      visit admin_root_path
      expect(current_path).to eq(new_user_session_path)
    end

    it 'regular users cannot access admin_root' do
      user = create(:user)
      login_as(user, scope: :user)
      visit admin_root_path
      expect(current_path).to eq(root_path)
    end

    it 'admin users can to visit admin_root' do
      user = create(:admin_user)
      login_as(user, scope: :user)
      visit admin_root_path
      expect(current_path).to eq(admin_root_path)
    end
  end
end
