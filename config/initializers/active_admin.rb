# -*- coding: utf-8 -*-
ActiveAdmin.setup do |config|
  config.site_title = "Prosperous"
  config.site_title_link = [:admin, :dashboard]
  config.authentication_method = :authenticate_user!
  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.cancan_ability_class = "Ability"
  config.on_unauthorized_access = :access_denied
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.logout_link_method = :get

  # == Root
  #
  # Set the action to call for the root path. You can set different
  # roots for each namespace.
  #
  # Default:
  # config.root_to = 'dashboard#index'


  config.allow_comments = false
  config.show_comments_in_menu = false
  # You can change the name under which comments are registered:
  # config.comments_registration_name = 'AdminComment'

  config.batch_actions = true

  # == Controller Filters
  #
  # You can add before, after and around filters to all of your
  # Active Admin resources and pages from here.
  #
  # config.before_filter :do_something_awesome

  # == Setting a Favicon
  #
  # config.favicon = '/assets/favicon.ico'


  config.namespace :admin do |admin|
    admin.build_menu do |menu|
      menu.add :label => "Metrics", :priority => 10, :url => [:admin, :metrics]
      menu.add :label => "Old Prospects", :priority => 101, :url => [:admin, :old_prospects]
    end
  end

  config.namespace :admin do |admin|
    admin.download_links = [:csv]
  end

  # == Pagination
  #
  # Pagination is enabled by default for all resources.
  # You can control the default per page count for all resources here.
  #
  # config.default_per_page = 30


  # == Filters
  #
  # By default the index screen includes a “Filters” sidebar on the right
  # hand side with a filter for each attribute of the registered model.
  # You can enable or disable them for all resources here.
  #
  # config.filters = true

end
