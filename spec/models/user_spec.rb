require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Creation' do
    before do
      @user = User.create!(email: "po@po.com", first_name: "Sergio", last_name: "Alves", password: "password", password_confirmation: "password")
    end
    it 'can be created' do
      expect(@user).to be_valid
    end

    describe 'validations' do
      it 'cannot be created without first_name' do
        @user.first_name = nil
        expect(@user).to_not be_valid
      end

      it 'cannot be created without last_name' do
        @user.last_name = nil
        expect(@user).to_not be_valid
      end
    end
  end
end
