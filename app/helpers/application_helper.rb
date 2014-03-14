module ApplicationHelper

  def controller_state_class(controller)
    controller_name == controller.to_s ? 'active' : 'unactive'
  end

  def page_state_class(key)
    if controller_name == 'pages'
      @page.key == key.to_s ? 'active' : 'unactive'
    else
      'unactive'
    end
  end

end
