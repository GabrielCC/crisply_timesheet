
class CrisplyEntry
  include HTTParty
  base_uri 'https://ltraven.crisply.com/crisply_sources/sources/data?token=DHIgdFg2rQ64AiJBaBgK0w'
  def self.create_from_timeentry(timeentry)

    options = self.format_entry(timeentry)
    self.my_logger.info options.to_json
    @response = self.post('',:body => options.to_json,
                   :headers => { 'Content-Type' => 'application/json' })
    self.my_logger.info @response
    self.my_logger.info @response.code
  end

  def self.format_entry(timeentry) 
    options = {      
      "timestamp" => "now", 
      "duration" => timeentry.hours,    
      "description" => timeentry.comments, 
      "activity_type" => 'task' ,          
      "user" =>  self.format_user(timeentry),
      "project" => self.format_project(timeentry)
  }
  options
  end
  
  def self.format_user(timeentry)
    user_timeentry = timeentry.user
    user  = {
      "id" => user_timeentry.login,
      "email" => user_timeentry.mail,
      "name" => user_timeentry.firstname + ' ' + user_timeentry.lastname
    }
    user
  end

  def self.format_project(timeentry)
    project_timeentry = timeentry.project
    project = {
      'id' => project_timeentry.name,
      'name' => project_timeentry.name
    }
    project
  end
  def self.my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/plugins/crisply_timesheet/log/testing.log")
  end
end