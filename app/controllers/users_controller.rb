class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      flash[:notice] = "ユーザー情報は全て削除されました"
      redirect_to root_path
    else
      flash[:danger] = "不正なアクセスです"
      redirect_back (fall_back root_path)
    end
  end
end