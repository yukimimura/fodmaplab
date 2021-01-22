class FoodsController < ApplicationController
  def index
    @categories = Category.all
  end
end