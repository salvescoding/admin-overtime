require 'rails_helper'

describe 'Posts' do

  describe 'navigate' do
    describe 'index' do

      it '200 OK' do
        visit posts_path
        expect(page.status_code).to eq(200)
      end

      it 'has a title of posts' do
        visit posts_path
        expect(page).to have_content(/Posts/)
      end
    end

    describe 'new' do
      it '200 OK' do
        visit new_post_path
        expect(page.status_code).to eq(200)
      end

      it 'create new post with form' do
        visit new_post_path

        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'Star Wars'

        click_on "Save"

        expect(page).to have_content(/Star Wars/)
      end
    end
  end
end
