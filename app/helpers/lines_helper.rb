module LinesHelper
  def choose_new_or_edit
  #  binding.pry
    if action_name == 'new' || action_name == 'confirm'
      confirm_lines_path
    elsif action_name == 'edit'
      line_path
    end
  end


  def choose_new_or_edit_BtnName
    if action_name == 'new' || action_name == 'confirm'
        "新規登録"
    elsif action_name == 'edit'
        "更新"
    end
  end

    def choose_new_or_edit_Method
      if action_name == 'new' || action_name == 'confirm'
          "GET"
      elsif action_name == 'edit'
          "PUT"
      end
    end

end
