class ProspectsDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value, :per_page, :offset, :total_entries, :reorder, :num_pages, :total_count, :accessible_by
end
