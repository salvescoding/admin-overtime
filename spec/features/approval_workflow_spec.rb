require 'rails_helper'

describe 'Approval workflow' do
  before do
    @admin_user = create(:admin_user)
    login_as(@user, scope: :user)
  end

  describe 'edit' do
    before do
      @post = create(:post)
      visit edit_post_path(@post)
    end

    it 'normal user have no status options' do
      logout(:user)
      user = create(:user)
      login_as(user, scope: :user)

      visit edit_post_path(@post)
      expect(page).to_not have_content(/Approved|Rejected|Submitted/)
    end

  end
end
