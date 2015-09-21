namespace :prospects do
  task :update_priority => :environment do
    Prospect.find_each do |prospect|
      prospect.priority = prospect.calculate_priority
      prospect.save
    end
  end
end
