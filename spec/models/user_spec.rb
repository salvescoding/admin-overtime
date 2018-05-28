require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end
  describe 'Creation' do
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

      it 'cannot be created without a phone' do
        @user.phone = nil
        expect(@user).to_not be_valid
      end

      it 'requires the phone to only have integers' do
        @user.phone = "984ius938"
        expect(@user).to_not be_valid
      end

      it 'accepts 9 numbers with no special characters or spaces' do
        @user.phone = "93834329324"
        expect(@user).to_not be_valid
      end
    end
  end

  describe 'instance methods' do
    it '#full_name' do
      expect(@user.full_name).to eq("Sergio Alves")
    end
  end
end
