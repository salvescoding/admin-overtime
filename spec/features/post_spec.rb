require 'rails_helper'

describe 'Posts' do
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }

  before do
    login_as(user, scope: :user)
  end

  describe 'Features' do

    describe 'index' do

      describe 'navigate' do

        it 'index page can be accessed' do
          visit posts_path
          expect(page.status_code).to eq(200)
        end

        it 'link to new post' do
          visit root_path
          click_link("new_post_from_nav")
          expect(page.status_code).to eq(200)
          expect(page).to have_content("New Post")
        end

        it 'has a scope so that only post creators can see their posts' do
          other_user = User.create(first_name: 'Non',
                                   last_name: 'Authorized',
                                   email: "nonauth@example.com",
                                   password: "asdfasdf",
                                   password_confirmation: "asdfasdf",
                                   phone: "958920929"
                                   )
          post_from_other_user = Post.create(date: Date.today, rationale: "This post shouldn't be seen", user_id: other_user.id, overtime_request: 2.7)

          visit posts_path

          expect(page).to_not have_content(/This post shouldn't be seen/)
        end

      end
    end

    describe 'show' do

      describe 'navigate' do

        # it 'visit show post page from index' do
        #   visit posts_path
        #   click_link(post_path(post))

        #   expect(current_path).to eq(post_path(post))
        # end

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
          fill_in 'post[overtime_request]', with: 1.8

          expect { click_on "Save" }.to change(Post, :count).by(1)
        end
      end

      describe 'association' do
        it 'post belongs to user' do
          fill_in 'post[date]', with: Date.today
          fill_in 'post[rationale]', with: 'User_Association'
          fill_in 'post[overtime_request]', with: 1.8
          click_on "Save"

          expect(User.last.posts.last.rationale).to eq("User_Association")
        end
      end
    end

    describe 'edit' do

      it 'can be edited by an authorized user' do
        visit edit_post_path(post)
        fill_in 'post[date]', with: Date.yesterday
        fill_in 'post[rationale]', with: "changed"
        click_on "Save"
        expect(page).to have_content("changed")
      end

      it 'cannot be edit if not is current user' do
        logout(:user)
        user = create(:not_authorised_user)
        login_as(user, scope: :user)
        visit edit_post_path(post)

        expect(current_path).to eq(root_path)
      end

    end

    describe 'destroy' do

      it 'can be deleted' do
        post_delete = create(:post, user_id: user.id)

        visit posts_path

        click_link("delete_#{post_delete.id}")

        expect(page.status_code).to eq(200)
      end


    end
  end

end
