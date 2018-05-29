require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  let(:audit) { create(:audit_log)  }
  let(:user)  { create(:user) }
  describe 'creation' do
    it 'can be created with valid data' do
      expect(audit).to be_valid
    end
  end

  describe 'validations' do
    it 'should not be valid without start date' do
      audit.start_date = nil
      expect(audit).to_not be_valid
    end

    it 'should not be valid without status' do
      audit.status = nil
      expect(audit).to_not be_valid
    end

    it 'should have a start date with 6 days prior' do
      audit = AuditLog.create!(user_id: user.id)
      expect(audit.start_date).to eq(Date.today - 6.days)
    end

  end
end
