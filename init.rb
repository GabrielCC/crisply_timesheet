require 'redmine'

# Patches to the Redmine core.
ActionDispatch::Callbacks.to_prepare do 
  require_dependency 'time_entry'
  # Guards against including the module multiple time (like in tests)
  # and registering multiple callbacks
  unless TimeEntry.included_modules.include? CrisplyTimesheet::TimeEntryPatch
    TimeEntry.send(:include, CrisplyTimesheet::TimeEntryPatch)
  end
end

Redmine::Plugin.register :crisply_timesheet do
  name 'Crisply Timesheet plugin'
  author 'Gabriel Croitoru'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  author_url 'http://gabrielcroitoru.ro'

  # require 'crisply_timesheet/hooks/controller_timelog_edit_before_save_hook.rb'
  require 'crisply_timesheet/hooks/model_timeentry_edit_before_save_hook.rb'
end
