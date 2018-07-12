module TasksHelper
  
  def sort_by_end_at(title)
    direction = params[:direction] == 'asc' ? 'desc' : 'asc'
    link_to title, direction: direction
  end

  def task_form_collection(attrs)
    Task.send(attrs).keys.map {|key| [I18n.t("activerecord.attributes.task/#{attrs}.#{key}"), key]}
  end

end