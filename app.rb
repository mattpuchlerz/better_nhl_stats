$LOAD_PATH.unshift File.dirname(__FILE__)

require 'sinatra'
require 'models'

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