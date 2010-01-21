require 'sinatra'

module Attributor
  def initialize name, attributes = {}
    self.name = name
    attributes.each_pair { |key, val| self.send "#{key}=", val }
  end
end

class NHL
  attr_accessor :conferences
  
  def initialize &block
    conferences = []
    instance_eval &block
  end
  
  def conference name, &block
    puts "Conference: #{name}"
    instance_eval &block
    # conf = Conference.new name
    # conferences << 
  end
  
  def division name, &block
    puts "Division: #{name}"
    instance_eval &block
  end
  
  def team name, options
    puts "Team: #{name}"
    # options.merge :name => name
    # Team.new options
  end
end

class Conference
  include Attributor
  attr_accessor :name, :divisions
end

class Division
  include Attributor
  attr_accessor :conference, :name, :teams
end

class Team
  include Attributor
  attr_accessor :division, :games_played, :losses, :name, :overtime_losses, :wins
  def points
    (wins * 2) + overtime_losses
  end
end

@nhl = NHL.new do
  conference 'Eastern' do
    division 'Atlantic' do
      team 'New Jersey Devils',   :games_played => 48, :wins => 33, :losses => 14, :overtime_losses => 1
      team 'Pittsburgh Penguins', :games_played => 51, :wins => 31, :losses => 19, :overtime_losses => 1
      team 'New York Rangers',    :games_played => 50, :wins => 24, :losses => 19, :overtime_losses => 7
      team 'New York Islanders',  :games_played => 50, :wins => 22, :losses => 20, :overtime_losses => 8
      team 'Philadelphia Flyers', :games_played => 48, :wins => 24, :losses => 21, :overtime_losses => 3
    end
  end
  conference 'Western' do
    division 'Central' do
      team 'Chicago Blackhawks',  :games_played => 50, :wins => 34, :losses => 12, :overtime_losses => 4
    end
  end
end

get '/' do
  erb :index
end



__END__



@@ index

<!DOCTYPE html>
<html>
  
  <head>
    <title>Hockey Standings</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="width = device-width" name="viewport">
    <!--[if IE]>
      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
    <![endif]-->
    <link href="/stylesheets/global.css" rel="stylesheet" type="text/css">
    <!-- <link href="/stylesheets/screen.css" media="screen, projection" rel="stylesheet" type="text/css"> -->
    <!-- <link href="/stylesheets/iphone.css" media="only screen and (max-device-width: 480px)" rel="stylesheet" type="text/css"> -->
    <!-- <link href="/images/favicon.ico" rel="shortcut icon" type="image/x-icon"> -->
  </head>
  
  <body>
    
    <section id="page_container">
      
      <header id="page_header">        
        <h1 id="page_title">Hockey Standings</h1>
      </header>
    
      <section id="page_content">
        This is the page content
      </section>
      
      <section id="site_footer">
        <p class="author">Another fine web page by <a href="http://matt.puchlerz.com">Matt Puchlerz</a>.</p>
      </section>
    
    </section>
    
    <% if false # Sinatra::Application.environment == :production %>
    <script type="text/javascript">
      var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
      document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
      try {
        var pageTracker = _gat._getTracker("UA-12203565-1");
        pageTracker._trackPageview();
      } catch(err) {}
    </script>
    <% end %>
    
  </body>
</html>