require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    before do
      @post = Post.create!(date: Date.today, rationale: "Anything")
    end
    it 'can be created' do
      expect(@post).to be_valid
    end

    describe 'validations' do
      it 'cannot be created without date' do
        @post.date = nil
        expect(@post).to_not be_valid
      end
      it 'cannot be created without rationale' do
        @post.rationale = nil
        expect(@post).to_not be_valid
      end
    end
  end
end
