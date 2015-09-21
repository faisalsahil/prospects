class Prospect
  module Search
    extend ActiveSupport::Concern

    module ClassMethods

      # IMPORTANT: anytime we add new search filters, we need to update the assignment view to relay those parameters
      # look in admin/prospects/index for #assign
      def search(params)
        search_scope = Prospect.scoped

        search_scope = search_scope.filter_by_ciks(params) if params[:ciks].present?
        search_scope = search_scope.filter_by_ids(params) if params[:ids].present?
        search_scope = search_scope.company_name_like(params[:company_name]) if params[:company_name].present?
        search_scope = search_scope.contact_name_like(params[:contact_name]) if params[:contact_name].present?
        search_scope = search_scope.where(:time_zone => params[:time_zone]) if params[:time_zone].present?
        search_scope = search_scope.where(["filing_agent ILIKE ?", "%#{params[:filing_agent]}%"]) if params[:filing_agent].present?
        search_scope = search_scope.assigned_to_user(params) if params[:user_id].present?

        search_scope
      end

      def assigned_to_user(params)
        if params[:user_id] == "unassigned"
          joins("LEFT JOIN prospect_assignments ON prospects.id = prospect_assignments.prospect_id").where("prospect_assignments.prospect_id IS NULL")
        elsif params[:user_id].present?
          user = User.find(params[:user_id])
          where(:id => user.prospect_ids)
        end
      end

      def filter_by_ciks(params)
        ciks = params[:ciks].split(',').map do |cik|
          raw_cik = cik.to_s.strip.to_i
        end
        where(:raw_cik => ciks)
      end

      def filter_by_ids(params)
        ids = params[:ids].split(',').map(&:strip)

        # expand 2-5 to 2,3,4,5
        ids.map! do |id|
          if id =~ /(\d+)\-(\d+)/
            ($1..$2).to_a
          else
            id
          end
        end
        ids.flatten!
        where(:id => ids)
      end

      def contact_name_like(name)
        where(["contact_name ILIKE ?", "%#{name}%"])
      end

      def company_name_like(name)
        where(["company_name ILIKE ?", "%#{name}%"])
      end
    end
  end
end
