require 'rails_helper'

describe 'Describe the audit log features' do

  describe 'index' do

    before do
      admin_user = create(:admin_user)
      login_as(admin_user, scope: :user)
      create(:audit_log)
    end
    it  'have an index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      visit audit_logs_path
      expect(page).to have_content("Sergio Alves")
    end

    it 'non admin users cannot access audit log index page' do
      logout(:user)
      user = create(:user)
      login_as(user, scope: :user)
      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end
  end
end
