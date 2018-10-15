class VocabulariesController < ApplicationController

  before_action :correct_user, only: [:show, :destroy]

  def show
  end

  def new
    @vocabulary = Vocabulary.new
  end

  def create
    @vocabulary = current_user.vocabularies.build(vocabulary_params)
    if @vocabulary.save
      redirect_to current_user
    else
      @q = Vocabulary.none.ransack
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'new'
    end
  end

  def destroy
    @vocabulary.destroy
    flash[:success] = "Vocabulary deleted"
    redirect_to request.referrer || root_url
  end

  def vocabulary_params
    params.require(:vocabulary).permit(:word, :meaning, :similarity, :example)
  end

  def correct_user
    @vocabulary = current_user.vocabularies.find_by(id: params[:id])
    redirect_to root_url if @vocabulary.nil?
  end
end
