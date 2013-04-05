module ItemsHelper

  def show_detail_info(item)
    "desc: #{item.description} | completed: #{item.completed}"
  end
end
