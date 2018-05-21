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
  end
end
