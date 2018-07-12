module TasksHelper

  def task_form_collection(attrs)
    Task.send(attrs).keys.map {|key| [I18n.t("activerecord.attributes.task/#{attrs}.#{key}"), key]}
  end

  def ransack_status_collection
    Task.statuses.to_a.map { |st| [I18n.t("activerecord.attributes.task/statuses.#{st[0]}"), st[1]] }
  end

end