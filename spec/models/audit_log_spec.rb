require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  let(:audit_log) { create(:audit_log)  }
  describe 'creation' do
    it 'can be created with valid data' do
      audit = create(:audit_log)
      expect(audit).to be_valid
    end
  end

  describe 'validations' do
    it 'should not be valid without start date' do

    end

  end
end
