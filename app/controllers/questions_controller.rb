class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  # newアクション
  def new
    @question = Question.new
  end

  # createアクション
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
    end
  end

  # Strong paramater: フォームから送ったデータの指定のデータだけを使うようにする（これ以外は無視する）
  private
    def question_params
      params.require(:question).permit(:name, :title, :content)
    end
end
