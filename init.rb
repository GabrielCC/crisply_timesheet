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
  description 'Crisply Timesheet plugin'
  version '0.0.1'
  settings :default => {'empty' => true}, :partial => 'settings/crisply_settings'
end
