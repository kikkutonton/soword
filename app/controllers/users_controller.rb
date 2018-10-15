class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
      @q = @user.vocabularies.ransack(vocabularies_search_params)
      @vocabularies = @q.result.paginate(page: params[:page])
    else
      @q = Vocabulary.none.ransack
      @vocabularies = @user.vocabularies.paginate(page: params[:page])
    end
    @url = user_path(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Soword!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def vocabularies_search_params
    params.require(:q).permit(:word_or_similarity_cont)
  end
end
