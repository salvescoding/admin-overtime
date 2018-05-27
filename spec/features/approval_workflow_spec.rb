require 'rails_helper'

describe 'Approval workflow' do
  let(:admin_user) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:approval_post) { create(:post, user_id: user.id) }
  before do
    login_as(admin_user, scope: :user)
  end

  describe 'edit' do

    it 'normal user have no status options' do
      logout(:admin_user)
      login_as(user, scope: :user)
      post = create(:post, user_id: user.id)

      visit edit_post_path(post)
      expect(page).to_not have_content(/Approved|Rejected|Submitted/)
    end

    it 'should not be editable after admin_user approval' do
      approval_post.approved!
      logout(:admin_user)
      login_as(user, scope: :user)

      visit edit_post_path(approval_post)

      expect(current_path).to eq(root_path)
    end

  end
end
