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
    if @question.save # saveメソッドでデータベースにデータを保存する
      redirect_to root_path, notice: 'Success!' #flash[:notice]
    else
      flash[:alert] = 'Save error!'
      render :new # :newでnewのページに入力したままの状態で戻る
    end
  end

  # 質問編集
  def edit
    # URLからidはparamsに入っているのでそれを元に検索
    @question = Question.find(params[:id])
  end

  # 編集した質問を更新する
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :edit
    end
  end

  # 削除
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: 'Delete Success!'
  end

  # 質問詳細ページの作成
  def show
    @question = Question.find(params[:id]) # idはURLの形式で取得する
    @answer = Answer.new # showで回答の投稿ができるようにする
  end

  # Strong paramater: フォームから送ったデータの指定のデータだけを使うようにする（これ以外は無視する）
  private
    def question_params
      params.require(:question).permit(:name, :title, :content)
    end
end
