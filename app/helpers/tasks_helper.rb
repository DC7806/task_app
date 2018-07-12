module TasksHelper
  
  def sort_by_end_at(title)
    direction = params[:direction] == 'asc' ? 'desc' : 'asc'
    link_to title, direction: direction
  end

end