require 'rails_helper'

describe 'Posts' do

  describe 'navigate' do
    describe 'index' do

      it '200 OK' do
        visit posts_path
        expect(page.status_code).to eq(200)
      end

    end

    describe 'new' do
      before do
        user = User.create!(email: "po@po.com", first_name: "Sergio", last_name: "Alves", password: "password", password_confirmation: "password")
        login_as(user, scope: :user)
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
