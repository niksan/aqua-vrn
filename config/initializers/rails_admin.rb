RailsAdmin.config do |config|
  config.authorize_with :cancan

  config.actions do
    dashboard
    index
    new do
      except ['Message']
    end
    edit do
      except ['Message']
    end
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
    nestable_list true
    configure :name, :string
    list do
      field :name
    end
    edit do
      field :name
    end
  end

  config.model 'Message' do
    configure :name, :string do
      read_only true
    end
    configure :email, :string do
      read_only true
    end
    configure :phone, :string do
      read_only true
    end
    configure :body, :text do
      read_only true
    end
    list do
      field :name
      field :email
      field :phone
      field :body
      field :created_at
    end
    edit do
      field :name
      field :email
      field :phone
      field :body
    end
  end

  config.model 'Photo' do
    nestable_list true
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
    configure :body, :ck_editor
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
    nestable_list true
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
