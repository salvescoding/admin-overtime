require 'rails_helper'

describe 'Posts' do
  before do
    @user = create(:user)
    login_as(@user, scope: :user)
  end
  describe 'index' do
    describe 'navigate' do

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

      it 'link new post' do
        visit root_path
        click_link("new_post_from_nav")
        expect(page.status_code).to eq(200)
        expect(page).to have_content("New Post")
      end
    end
  end

  describe 'new' do
    before do
      visit new_post_path
    end

    describe 'navigate' do
      it '200 OK' do
        expect(page.status_code).to eq(200)
      end

    end

    describe 'create' do
      it 'create new post with form' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'Star Wars'

        click_on "Save"

        expect(page).to have_content("Star Wars")
      end
    end

    describe 'association' do
      it 'post belongs to user' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'User_Association'
        click_on "Save"

        expect(User.last.posts.last.rationale).to eq("User_Association")
      end
    end
  end

  describe 'edit' do
    before do
      @post = create(:post)
    end

    describe 'navigate' do
      it 'can reach the edit page' do
        visit posts_path
        click_link("edit_#{@post.id}")
        expect(page.status_code).to eq(200)
      end

    end

    describe 'update' do
      it 'can be edited and saved' do
        visit edit_post_path(@post)
        fill_in 'post[date]', with: Date.yesterday
        fill_in 'post[rationale]', with: "changed"
        click_on "Save"
        expect(page).to have_content("changed")
      end

    end
  end

  describe 'destroy' do
    before do
      @post = create(:post)

    end
    it 'click on link destroy' do
      visit posts_path
      click_link("delete_#{@post.id}")
      expect(page.status_code).to eq(200)
    end


  end
end
