- a virtual attribute lets you create a special attribute without putting it in the schema or doing a migration like 'first_name'
- irb gives up a connection to the ruby vs. rails c which gives us access to the rails environment
- bcrypt: encrpts passwords by salting them
- pry is an irb but with more functionality, It is an attempt to bring REPL driven programming to the Ruby language. (REPL:read, evaluate, print, loop back to step one ) is responsive coding
  - in pry: require 'bcrypt', true, ex. want to encrpyt a ss num, snn = BCrypt::Password.create("55555555"), returns a long string a numbers and letters and stores in variable snn, can confirm it is their password by using snn == "55555555"

- computers can't be random, they can only do what they are told, but can use concept of salt or a different starting point

- Controllers Responsibilites:
  - they communicate with routing engine to know which pages to show or parameters to use
  - you have a direct connection between controller and view
  - Data FLOW: if put in localhost:3000/portfolio/4, it will look in routes.rb for a route that has portfolio, it finds it and sees there is a parameter of id and it stores those in the params hash. Then, the controller takes over in the show action, it says I have the parameters, I'm going to run a database query on the portfolio model, store it in the @portfolio_item instance variable, instance variable gets passed into the view. (Everything started in router and then stored in params hash, then controller took over, it stores info in instance variable and make it available to view,    )

- <%= params.inspect %> (params is a special ruby term that is hash so you can store key and value pairs)
  <hr>
  The <hr> HTML element represents a thematic break between paragraph-level elements: for example, a change of scene in a story, or a shift of topic within a section.

<%= params.inspect %> can also do params[:id] just to see the value of that key
Can put above in file and see the hash

Sessions:
  - can put <hr> <%= session.inspect %> in show page, refresh page to see the whole user session or how your app is communicating with the browser
  - the whole session is stored in cookie format in your browser
  - good to use incognito tabs when working with sessions so you don't get them messed up
  - ex. http://[::1]:3000/portfolio/4?q=twitter ( everything after the q is a query), if you inspect the session, you will see it in QUERY_STRING =
  - sessions are not very secure and can get hacked easily so never put important data like credit card nums etc in it
  - going to an incognito tab starts a new session

Null Object Pattern:
- behavior you can do from controller to manage what websites if someone is logged in or if it is a guest

Views:
- by default Rails uses application layout file
- 
