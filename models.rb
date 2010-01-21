module Attributor
  def initialize name, attributes = {}
    self.name = name
    attributes.each_pair { |key, val| self.send "#{key}=", val }
  end
end

class NHL
  attr_accessor :conferences
  
  def initialize &block
    @conferences = []
    instance_eval &block
  end
  
  def conference name, &block
    @current_conference = Conference.new name
    @conferences << @current_conference
    instance_eval &block
  end
  
  def division name, &block
    @current_division = Division.new name, :conference => @current_conference
    @current_conference.divisions << @current_division
    instance_eval &block
  end
  
  def team name, options
    team = Team.new name, options.merge(:division => @current_division)
    @current_division.teams << team
  end
end

class Conference
  include Attributor
  attr_accessor :name, :divisions
  def divisions
    @divisions ||= []
  end
end

class Division
  include Attributor
  attr_accessor :conference, :name, :teams
  def teams
    @teams ||= []
  end
end

class Team
  include Attributor
  attr_accessor :division, :games_played, :losses, :name, :overtime_losses, :wins
  def points
    (wins * 2) + overtime_losses
  end
end
