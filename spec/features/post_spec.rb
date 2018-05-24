require 'rails_helper'

describe 'Posts' do
  before do
    @user = create(:user)
    login_as(@user, scope: :user)
  end
  describe 'navigate' do
    describe 'index' do

      it '200 OK' do
        visit posts_path
        expect(page.status_code).to eq(200)
      end

      it 'has a list of posts' do
        post1 = create(:post)
        post2 = create(:second_post)
        visit posts_path

        expect(page).to have_content(/rationale|content/)
      end

    end

    describe 'new' do
      before do
        visit new_post_path
      end

      it '200 OK' do
        expect(page.status_code).to eq(200)
      end

      it 'create new post with form' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'Star Wars'

        click_on "Save"

        expect(page).to have_content("Star Wars")
      end

      it 'association post belongs to user' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'User_Association'
        click_on "Save"

        expect(User.last.posts.last.rationale).to eq("User_Association")
      end
    end


  end
end
