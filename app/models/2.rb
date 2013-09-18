require 'rest_client'
class CrisplyEntry
 # base_uri 'https://gabrielcc.crisply.com/crisply_sources/sources/data?token=bCZtj0Mu7-Ugt2rrxy7y-A'
  def self.create_from_timeentry(timeentry)

  	options = self.format_entry(timeentry)
  	self.my_logger.info options.to_json
  	@response = RestClient.post 'https://gabrielcc.crisply.com/crisply_sources/sources/data?token=bCZtj0Mu7-Ugt2rrxy7y-A', options.to_json, :content_type => :json, :accept => :json
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