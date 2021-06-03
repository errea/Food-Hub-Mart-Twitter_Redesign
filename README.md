![](https://img.shields.io/badge/Microverse-blueviolet)

# Ruby on Rails [Building With Active Records and Assoiciations:[Private-Event].

This project is build for the Ruby on Rails capstone which is based on a redesign of Twitter. It's a real-world-like project, built with business specifications.
      

<div align="center">

[![View Code](https://img.shields.io/badge/View%20-Code-green)](https://github.com/Dipeshtwis/twitter-redesign)
[![Github Issues](https://img.shields.io/badge/GitHub-Issues-orange)](https://github.com/Dipeshtwis/twitter-redesign/issues)
[![GitHub Pull Requests](https://img.shields.io/badge/GitHub-Pull%20Requests-blue)](https://github.com/Dipeshtwis/twitter-redesign/pulls)

</div>

## 📝 Contents

<p align="center">
<a href="#with">Built with</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#sc">Screenshot</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#ll">Live Demo Link</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#gs">Getting started</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#author">Author</a>
</p>



># [Capstone Description]
>This assignment consists of using the Devise gem to have a first approach at authentication in rails. I was able to build an application A project completed as part of  the Microverse Ruby on Rails Pathwright [Find project specifications here](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations) to dive into ActiveRecord’s associations. The project involves building a private website with similar functionality to the well known event organization and management platform [Eventbrite](https://www.eventbrite.com/).

## 🔧 Built with<a name = "with"></a>

- Ruby on Rails (Version: 6.0.3.2)
- Ruby (Version: 3.0.0)
- Postgresql (version: 12)
- [Rspec](https://relishapp.com/rspec/rspec-rails/docs/model-specs)
- [Capybara](https://www.codewithjason.com/rails-testing-hello-world-using-rspec-capybara/)
- Shrine Gem
- Cloudinary
- Ruby on Rails
- webpack
- Heroku
- Sqlite
- Postgres
- MVC pattern
- Node.js
- Yarn

## Getting Started <a name = "gs"></a>
> To get a local copy up and running follow these simple example steps.

<details>
  <summary>Get instructions</summary>

```
$ cd <folder>
```

~~~bash
$ git clone git@github.com:Dipeshtwis/twitter-redesign.git
$ cd twitter-redesign
$ bundle install
$ yarn install --check-files
~~~

Setup database with:

> make sure you have postgres sql installed and running on your local machine

> Go to config > database.yml

Replace ```xxx``` with your ```own``` postgresql username and password
```
username: xxx
password: xxx
```

> create and migrate the database by these commands

```
   rails db:create
   rails db:migrate
```

### How to run

Start server with:

```
    rails s
```

Open `http://localhost:3000/` in your browser.


## To run Test

~~~ruby
$ rails db:migrate RAILS_ENV=test
$ rspec --format documentation

~~~
  Clone the repo to your local machine: 
  ```ruby
  $ git clone git clone https://github.com/Mihndim2020/Private-Events.git
  ```
  Then, install the needed gems:
  ```ruby
  $ bundle install --without production
  ```
  Next, migrate the database:
  ```ruby
  $ rails db:migrate
  ```
  If you want to load sample users and events, use seeds:
  ```ruby
  $ rails db:seed
  ```
  Finally, on root path run a local server:
  ```ruby
  $ rails server
  ```
  Open browser to view application:
  ```ruby
  localhost:3000
  ```
</details> 

## Prerequisites
- Vscode
- Heroku CLI
- Terminal
- Linters Test
- Rubocop style guide

## Set up
* Open your terminal and locate the folder you want to clone the repository and follow the steps below to install

## Install

Run the following command into your terminal:

```console
run bundle install --without production

run rails db:migrate to migrate files
```

## Project Structure

    ├── README.md
    ├── bundle
    │   └── main.rb
    └── .github\workflows
        └── linters.yml
    └── app
        └── assets
        └── channels
        └── controllers
        └── helpers
        └── jobs
        └── mailers
        └── models
        └── views    
    └── bin
    └── config
    └── db
    └──log
    └── bin
    └── public
    └── storage
    └──test

## Live Demo Link <a name = "ll"></a>

[Live Demo](https://bookhelpy.herokuapp.com)

## Deployment
1) Git clone this repo and cd the to the `private_events` directory.
2) Run `rails server` in command line to open the application server in your browser via http://localhost:3000 or something similar
3) Run `heroku start`.
4) heroku run
5) heroku run rails db:migrate
6) git push heroku main
7) heroku run console

## Functionality

Logged in users can create, edit, and invite/uninvite other users to their own events. Users can change their RSVPs to upcoming invitations, but not to past ones.

Event hosts can only uninvite users who have not yet confirmed their attendance and can only update the invitation list for upcoming events.

## Thoughts

One of the main challenges we encountered ran into was deciding how to allow event hosts to invite guests. With our current form-related skillset a checkbox seemed to be the best option, but ideally there would be a text field that autocompletes from the database of users. I struggled for a long time to try for an efficient way of prechecking the box of any user who was already invited:

```ruby
User.order(:username).includes(:invitations).each do |user|
{ checked: user.invitations.any? { |inv| inv.event_id == @event.id } } # Ruby; no index
  
User.order(:username).includes(:invitations).each do |user|
{ checked: user.invitations.exists?(event: @event) } # n+1 query
  
User.all.order(:username)
  .includes(:invitations)
  .where('invitations.event_id = ?', @event.id)
  .references(:invitations).each #where clause filters users, not invitations

{ checked: @event.invitations.exists?(recipient_id: user.id) }) # n+1 query

{ checked: @event.invitations.any? { |inv| inv.recipient_id == user.id } } # Ruby; no index

temp_invitations = @event.invitations.pluck(:recipient_id)
{ checked: !!temp_invitations.delete(user.id) } # much faster than anything else I tried

```

Our eventual solution has the advantages of only making one query, storing a relatively lightweight array of `recipient_id` integers, and diminishing average search times as found elements are deleted from the array. It was much faster than any alternative I tried. Still, it doesn't feel like the most elegant solution.

Another big disadvantage of the checkbox approach for invitations was that I need to handle every invitation for an event any time its invitation list is updated, since there's no way to know which ones changed and target only those. For a large database of users this implementation would need to improve.

We had to use `user.username` instead of `f.label(user.id, user.username)` for the checkbox labels in order to get them to display inline.

We used a scaffold generator for the `Event` model, which proved helpful and educational.

For this project I was a little pickier about the styling, and decided I didn't want the `field-with-error` class applied on `label` elements. To avoid that particular piece of Rails magic I just went with the raw html `<label for='event_name'>Name</label>` instead of `<%#= form.label :name %>`.

##### Testing

We wrote tests for `spec/controllers/events_controller_spec.rb`, and  `spec/models/*` using the `shoulda-matchers`, `rails-controller-testing`, and `factory-bot-rails` gems. In projects where I wrote my own authorization I had been using this helper method to stub methods related to authentication:

```ruby
def login(user)
  allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
  allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
end
```

With Devise, however, I just needed to add these lines to `spec/rails_helper.rb`:

```ruby
config.include Devise::Test::IntegrationHelpers, type: :request
config.include Devise::Test::ControllerHelpers, type: :view
config.include Devise::Test::ControllerHelpers, type: :controller
```

Then I could use the simple method Devise provides: `sign_in user`.

Because `rspec-rails` was already bundled when I generated the `Event` scaffolding, a bunch of tests were generated in the `spec` folder. I decided to look into these and make them pass as well since they contained techniques I hadn't seen before.

I didn't encounter too many snags here, but getting syntax that worked for stuff like `assert_select "div", /Nov 11 2022 12:00am/, count: 1` in the view specs took me a while. 

I was also getting this quirky error with the views:

```
ActionView::Template::Error:
       Error: Function rgb is missing argument $green.
               on line 465 of stdin
       >>   background-color: rgb(216 216 216);
```

The issue was the missing alpha value in `application.css` (which was not actually an issue outside the view tests), but I was confused about line 465 and mentions of stdin, which didn't correspond to anything in my project folder but were probably results of the Asset Pipeline.
Things you may want to cover:

## Screenshot <a name = "sc"></a>

### Home Page

![screenshot](./app/assets/images/Book_Helper.png)

### Profile Page

![screenshot](./app/assets/images/Book_Helper_profile.png)


For those who are not patient, here are a couple of screenshots of what it looks like

<p float = 'left'>
  <img src="img/private_events.png" alt="Private events home page" width="400" height="300">
  <img src="img/private_events2.png" alt="Private events event card" width="400" height="300">
  <img src="img/private_events3.png" alt="Private events guest list" width="4000" height="300">
  <img src="img/rspec.png" alt="Private events guest list" width="400" height="300">
</p>

## Functionality

As far as this is a training app with focus on ActiveRecord's associations, User authentication and authorization are extremely barebone with no validations or real security of access: no need for a password, anyone is able to sign in/sign up through a basic hand-rolled authentication by their name. After the registration/login they're able to create events, invite other users as well as to enroll for events organized by others. Always because it's an exercise, users can create and enroll for the events with the past dates to practice rails' scopes. In a similar vein, just strictly necessary RESTful actions were implemented in the controllers: for example, you can't edit/delete users/events. Nevertheless, the styling was not requested, I built a minimalistic design using `bulma` gem, a CSS framework based on Flexbox.

## Reflection

This was an awesome rundown practice and I had a really joyful fun playing with associations, until I bumped into extra credit on allowance to invite other users.

<details>
  <summary>Spoiler alert! Click to continue reading...</summary>

  In the beginning, I added an `Invitations` model to my app, because in real world `invitation` and `enrollment` are two conceptually different things. And I made it work with this setup. IMHO, two join models looked very similar:
  ```ruby
  class Enrollment < ApplicationRecord
    belongs_to :event
    belongs_to :user
  end
  class Invitation < ApplicationRecord
    belongs_to :event
    belongs_to :host, class_name: "User"
    belongs_to :invitee, class_name: "User"
  end
  ```
  So, I decided to go with one model, got rid off `Invitations` and put everything in `Enrollment`.
  ```ruby
  class Enrollment < ApplicationRecord
    belongs_to :event
    belongs_to :user
    belongs_to :host, class_name: "User"
    belongs_to :invitee, class_name: "User"
  end
  ```
  As far as `User` invites other `User`, it felt right to apply self joins, so I created something like
  ```ruby
  class User < ApplicationRecord
    has_many :events
    has_many :enrollments
    has_many :attended_events, through: :enrollments, source: :event
    
    has_many :invited_users, foreign_key: "host_id", class_name: 'Enrollment'
    has_many :invitees, through: :invited_users
    has_many :hosting_users, foreign_key: "invitee_id", class_name: 'Enrollment'
    has_many :hosts, through: :hosting_users
  end
  ```
  And to my surprise associations were working! As far I got rid off `Invitation` controller I had no idea on how to split `enrollment` and `invitation` creation, what routes to use, etc. At this point I tried different things and finished asking support to the forum. @GopherJackets was really helpful in the understanding of my model set up and cleaning it up. Then the conversation with @nalyk inspired me to find an interesting solution: when a creator of the event sends an invitation, it triggers the creation of a new `enrollment` joining only `invitee_id` and `event_id` (I had to set `user_id` as `optional` to make it work). When the invited user accepts the invite by enrolling to the event, it was updating an existing `enrollment` with his `id` in `user_id` column. The only issue was on how to drop an enrollment without canceling the invitation. And here I had an eye-opening talk with @Roli who not only explained how to fix the bug, but helped me polish completely the app and adviced to use `enum status`, which makes the extra task super easy. You're seeing the final result of Data model.

  A couple of interesting articles on `enum` are [here](https://sipsandbits.com/2018/04/30/using-database-native-enums-with-rails/) and [here](https://naturaily.com/blog/ruby-on-rails-enum).

</details>  

## ✒️  Authors <a name = "author"></a>

👤 **Eri**

- Github: [@errea](https://github.com/errea)
- Twitter: [@Erreakay](https://github.com/errea)
- Linkedin: [Eri Okereafor](https://www.linkedin.com/in/eri-ngozi-okereafor/)
  
## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Mihndim2020/Private-Events/issues).

## 👍 Show your support

Give a ⭐️ if you like this project!
- Design Idea by: [Gregoire Vella](https://www.behance.net/gregoirevella)

- Microverse: [@microverse](https://www.microverse.org/)

## Acknowledgments

- Microverse

## 📝 License

This project is [MIT](./MIT.md) licensed.


<h3 align="center">Life Style Blog-Ruby on Rails</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)](https://github.com/umairarshadbutt/life-style)
[![Github Issues](https://img.shields.io/badge/GitHub-Issues-orange)](https://github.com/umairarshadbutt/life-style/issues)
[![GitHub2 Pull Requests](https://img.shields.io/badge/GitHub-Pull%20Requests-blue)](https://github.com/umairarshadbutt/life-style/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)
[![Linkedin](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/umair-arshad-butt/)
[![Gmail](https://img.shields.io/badge/-Gmail-c14438?style=flat&logo=Gmail&logoColor=white)](mailto:Umair,umair6622@gmail.com)
[![Portfolio](https://img.shields.io/badge/umair--arshad-Portfolio-brightgreen)](https://umairarshad.me/)
</div>
<p align="center">It is the rails capstone project and is compulsory to master the ruby on rails curriculum. This project is all about articles like a blog app.</p>
