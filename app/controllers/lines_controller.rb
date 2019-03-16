class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  # 一覧画面(ついったーっぽく、新しい投稿ほど上に来るように)
  def index
  @view_name="lines_index"
    @lines = Line.all.order(id: "DESC")
  end

  # 新規画面表示
  def new
  @view_name="lines_new"
    if params[:back]
      @line = Line.new(line_params)
    else
      @line=Line.new
    end
  end

  # 更新画面……情報は「set_line」で取得
  def edit
    @view_name="lines_edit"
  end

  # 閲覧画面……情報は「set_line」で取得
  def show
    @view_name="lines_show"
  end

  #確認画面表示
  def confirm
    @view_name="lines_confirm"
    @line = Line.new(line_params)

    if @line.invalid?
      @view_name="lines_new"
      render 'new'
    end
  end

  #新規登録処理
  def create

    @line = Line.new(line_params)

    respond_to do |format|
      if @line.save

        #処理後は投稿内容確認画面に移動(一覧に移動させる場合は引数を@line→lines_pathと変更)
        @view_name="lines_show"
        format.html { redirect_to @line, notice: 'つぶやきました。' }
      else
        @view_name="lines_new"
        format.html { render :new }
      end
    end
  end

  # 更新処理……情報は「set_line」で取得
  def update
    respond_to do |format|
      if @line.update(line_params)

        #処理後は投稿内容確認画面に移動(一覧に移動させる場合は引数を@line→lines_pathと変更)
          @view_name="lines_show"
        format.html { redirect_to @line, notice: '更新に成功しました。' }
      else
        @view_name="lines_edit"
        format.html { render :edit }
      end
    end
  end

  # 削除処理
  def destroy
    @line.destroy
    respond_to do |format|
      @view_name="lines_index"
      format.html { redirect_to lines_url, notice: '削除に成功しました。' }
      format.json { head :no_content }
    end
  end

  private
    # idでデータ取得
    def set_line
      @line = Line.find(params[:id])
    end

    #DB更新用にパラメータセット
    def line_params
      params.require(:line).permit(:content)
    end
end
