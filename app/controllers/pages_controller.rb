class PagesController < ApplicationController
  def home
    @pending_approvals = Post.where(status: 'submitted')
  end
end
