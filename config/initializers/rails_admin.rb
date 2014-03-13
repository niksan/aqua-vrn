RailsAdmin.config do |config|

  config.actions do
    dashboard
    index
    new
    edit
    delete
    nestable
  end

  config.main_app_name = ['Aqua-Vrn', 'Admin']
  config.current_user_method { current_user } # auto-generated

  config.excluded_models = ['Role', 'Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture']

  [:email, :title].each do |method|
    config.label_methods << method
  end

  config.model 'Photogallery' do
    configure :name, :string
    list do
      field :name
    end
    edit do
      field :name
    end
  end

  config.model 'Photo' do
    configure :photogallery, :belongs_to_association
    configure :name, :string
    configure :image, :carrierwave
    list do
      field :image
      field :name
      field :photogallery
    end
    edit do
      field :photogallery
      field :name
      field :image
    end
  end

  config.model 'Page' do
    configure :title, :string 
    configure :body, :text 
    configure :key, :string 
    list do
      field :title
      field :key
    end
    edit do
      field :title
      field :body, :ck_editor
      field :key
    end
  end

  config.model 'Service' do
    configure :name, :string 
    configure :image, :carrierwave
    configure :description, :text 
    list do
      field :image
      field :name
    end
    edit do
      field :name
      field :description, :ck_editor
      field :image
    end
  end

  config.model 'Role' do
    visible false
    configure :name, :string 
    edit do
      field :name
    end
  end

  config.model 'User' do
    configure :roles do
      inverse_of :users
    end
    configure :email, :string 
    configure :password, :password         # Hidden 
    configure :password_confirmation, :password         # Hidden 
    configure :sign_in_count, :integer 
    configure :last_sign_in_at, :datetime 
    configure :last_sign_in_ip, :string 
    list do
      field :email
      field :sign_in_count
      fields :last_sign_in_at
      field :roles
    end
    edit do
      field :email
      field :password
      field :roles
    end
  end

end
