class HomesController < ApplicationController
  def top
    @new = Recipe.limit(3).order('id DESC')
    @ranking = Recipe.includes(:favorited_users).sort{|a,b| b.favorited_users.size <=> a.favorited_users.size}.first(3)
  end
end