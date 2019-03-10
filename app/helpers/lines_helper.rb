module LinesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_lines_path
    elsif action_name == 'edit'
      line_path
    end
  end
end
