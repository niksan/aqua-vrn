RailsAdmin.config do |config|

  config.actions do
    dashboard
    index
    new
    export
    history_index
    bulk_delete
    show
    edit
    delete
    history_show
    show_in_app
    nestable
  end

  config.main_app_name = ['Aqua-Vrn', 'Admin']
  config.current_user_method { current_user } # auto-generated

  config.excluded_models = ['Role', 'Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture']

  [:email, :title].each do |method|
    config.label_methods << method
  end


end
