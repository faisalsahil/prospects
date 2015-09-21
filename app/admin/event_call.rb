ActiveAdmin.register Event::Call, :as => "Calls" do
  menu :priority => 3

  actions :index

  index do
    column :user, :sortable => "users.first_name"
    column :prospect, :sortable => "prospects.contact_name"
    column :type
    column :response
    column :follow_up
    column :audio do |call|
      if call.file.url
        audio :controls => "controls", :preload => "none" do
          source :src => call.file.url, :type => "audio/mpeg"
          "Your browser does not support the audio element."
        end
      end
    end
    column :file do |call|
      link_to "open", call.file.url, :target => "_blank"
    end
    column :created_at
  end

  controller do
    def scoped_collection
      Event::Call.includes(:user, :prospect)
    end
  end
end
