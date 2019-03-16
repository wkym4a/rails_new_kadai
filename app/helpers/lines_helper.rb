module LinesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_lines_path
    elsif action_name == 'edit' || action_name == 'update'
      line_path
    end
  end

  #ボタン名取得用
  def choose_new_or_edit_BtnName
    if action_name == 'new' || action_name == 'confirm'
        "新規登録"
    elsif action_name == 'edit' || action_name == 'update'
        "更新"
    end
  end

  #メソッド取得用
  def choose_new_or_edit_Method
    if action_name == 'new' || action_name == 'confirm'
        "GET"
    elsif action_name == 'edit' || action_name == 'update'
        "PUT"
    end
  end

  def get_title_name
  #  binding.pry
    case @view_name
      when "tops_index"
        return "トップ画面です。"

      when "lines_new"
        return "つぶやいてください。"

      when "lines_confirm"
        return "こうつぶやきますか？"

      when "lines_edit"
        return "つぶやきを変更してください。"

      when "lines_index"
        return "一覧"

      when "lines_new"

      when "lines_show"
        return "↓こうつぶやきました。↓"

      else
        return "エラー……想定外の画面です。"
      end
  end

end
