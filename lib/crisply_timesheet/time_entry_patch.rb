module CrisplyTimesheet
  # Patches Redmine's TimeEntry dynamically.  Adds a +after_save+ filter.
  module TimeEntryPatch
    def self.included(base) # :nodoc:
      base.extend(ClassMethods)

      base.send(:include, InstanceMethods)

      # Same as typing in the class 
      base.class_eval do
        unloadable # Send unloadable so it will not be unloaded in development

        after_save :save_to_crisply

        # Add visible to Redmine 0.8.x
        unless respond_to?(:visible)
          named_scope :visible, lambda {|*args| { :include => :project,
              :conditions => Project.allowed_to_condition(args.first || User.current, :view_issues) } }
        end
      end

    end
    
    module ClassMethods
    end
    
    module InstanceMethods
      # This will send the associated information to crisply
      def save_to_crisply
        self.reload
        Rails.logger.info self.to_json
        Rails.logger.info 'fuck'
        return true
      end
    end    
  end
end