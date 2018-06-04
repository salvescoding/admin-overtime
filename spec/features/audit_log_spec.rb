require 'rails_helper'

describe 'Describe the audit log features' do

  describe 'index' do

    before do
      admin_user = create(:admin_user)
      login_as(admin_user, scope: :user)
    end
    it  'have an index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      create(:audit_log)
      visit audit_logs_path
      expect(page).to have_content("Sergio Alves")
    end
  end
end
