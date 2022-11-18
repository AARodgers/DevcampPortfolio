Need to:
1. Finish section 12 part 129: Publishing a gem to rubygems.org
2. Moves these notes before publishing



Sample Users: email: glove@email.com, name: glove, pass: gloves


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
  - [::1]:3000?q=facebook  use this to test sessions in an incognito window

Null Object Pattern:
- behavior you can do from controller to manage what websites if someone is logged in or if it is a guest

Views:
- by default Rails uses application layout file

Partials:
- a HTML file of code that is used in multiple files/views, start with _ , ex. _forms.html.erb, rails knows that files that start with _ is a partial
- call a partial by using "render 'form', blog: @blog" the blog part allows you put data in the form
- can make a shared folder in the view folder for partials
- to call a partial put `render file_path(don't need to put view b.rails already knows that)
- ex. render 'shared/nav' ( don't need underscore when using render)


Data Flow: the controller actions pass data to the views via instance variables
Ex. in blog controller in new action you create a new instance of a blog and store it in a @blog, variable, from there it is passed to the new.html.erb template where @blog is now a transfered into blog,
a local variable, it is used inside the _form partial as a local

View Helpers:
- are written in ruby and can be shared among views
- can use the helpers folder
- use when you have conditional logic like 'if current_user?' especially if it is used in multiple places
- typically want to leave conditional logic outside of views
- How to know when to use a view helper vs. a partial: if their is logic that has conditionals ( if this than that) needed in the view and the majority of the
code is ruby logic then use a view helper. If you have something like the nav bar where the majority of it is html, then use a partial

Content Helpers:
-  content helper methods can be used in a view
- ex <%= content_tag :p, class: "my-special_class" do %>
        Hi, I'm in a paragraph tag
    <% end %>
    Is the same thing as <p class: "my-special_class">Hi, I'm in a paragraph tag</p>
    Can also pass in :h1, to wrap text in a h1 tag

    will show the text in the home page, :p is passing in a paragragh, if click inspect on paragraph, will see that it generated html for it in browser

- instead of writing:
def sample_helper
  "<p>sldkfjsdl</p>".html_safe
end
Write a content helper like:

- Convention over configuration:

-ActionView Helper Methods(view helper methods):  see docs for all helper methods
  ex. "Published x hours ago" (distance_of_time_in_words), to phone number, <%= number_to_currency "150" %> => $150.00,
  <%= number_to_percentage "80.4" %> => 80.400%, <%= number_with_delimieter "15054647657" %> (adds commas
  to num)
  - If start new app with rails new, rails db:create, rails db:migrate. If have controller name GuidesController, you would create a folder in views called guides and it
  will look for a file in view called guides, if have method in controller called 'def book' you need to
  make a file in guides called: book.html.erb, then in routes do: get 'guides/book'.
  - Summary: you have a controller with an action name (name of method), the action name is wired to the
  view file named the same thing, Controller name is mapped to view directory name and it will look for file with controller method name,

  <hr> creates a horizontal line that separates sections

  If have <%= render @blog %> but you want to implement something in that partial like a spacer_template
  you need to explicitly say 'render partial: ' so would have: <%= render partial: @blogs, spacer_template: 'blog_ruler' %>

  Can call in another style sheet by adding: <%= stylesheet_link_tag "the style sheet" %>

  - Caching (if you have a slow loading page like a lot of html and css):
    - rails let you wrap it all up in a cache (it's like a zip file), it is compiled for you and will
    let you render it faster in browser.
    - It saves the html to the clients browser, so be careful how/when you use it b. client might have old version of html even if you pushed up new code. Another reason for a slow load of a website is a
    slow database query, can't fix that with cache b. it is server side
    - Looks like:
    <% cache do% >
      <%= render partial: @blogs, spacer_template: 'blog_ruler' %>
    <% end %>

Professional DeBugging in Rails:
1. Using puts:
  a. If expected to see all blogs but didn't can put:
    def index
      @blogs = Blog.limit(2)
      puts "*" * 500 (since it is hard to find what prints out in terminal along with everything else)
      puts @blogs.inspect
      puts "*" * 500
      @page_title = "My Portfolio Blog"
      # dynamically changes what it says on the tab on the browser
    end
    Then look in the terminal

2. Gem - Byebug
  a. gives you a working breakpoint ( it's like binding.pry where it stops the operation and you have a console to checkout what things are)
  b. can type in variables or session to see what is being processed or params (output is #<ActionController::Parameters {"controller"=>"blogs", "action"=>"index"} permitted: false>)
  c. if in byebug console and want to get out type: continue

3. Pry - gem
  a. need to install
  b. can put binding.pry in multiple places, see terminal notes for commands

4. Error Management
  a.
