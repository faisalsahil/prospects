ActiveAdmin.register User do
  menu :priority => 1

  actions :all, :except => [:destroy]

  filter :email

  index do
    column :email do |u|
      link_to u.email, [:admin, u]
    end
    column "Assigned Prospects" do |u|
      u.prospects.size
    end
    column "Called Prospects" do |u|
      u.called_prospects.size
    end
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    actions :defaults => false do |u|
      link_to "Edit", edit_admin_user_path(u)
    end
  end

  show do |ad|
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :phone
      row "Assigned Prospects", :sortable => :"prospects.count" do |u|
        u.prospects.count
      end
      row "Called Prospects", :sortable => :"called_prospects.count" do |u|
        u.called_prospects.count
      end
      row "# of Calls", :sortable => :"call_events.count" do |u|
        u.call_events.count
      end
    end
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :phone
    end
    f.buttons
  end

  controller do
    def scoped_collection
      User.includes(:prospects, :called_prospects)
    end
  end
end
