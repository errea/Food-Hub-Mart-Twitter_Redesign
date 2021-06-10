![](https://img.shields.io/badge/Microverse-blueviolet)

# Rails [Twitter-Redesign: Food Mart Hub].

This project is build for the Ruby on Rails capstone which is based on a redesign of Twitter. It's a real-world-like project, built with business specifications. [Find project specifications here](https://www.notion.so/Rails-Capstone-project-Twitter-Redesign-ebd18948247d447293f5894a4ea5b393)
      

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
>Capstone projects are solo projects at the end of the each of the Microverse Main Technical Curriculum sections. Building this project is very important for you because

- It's a real-world-like project, built with business specifications that will look really nice in your portfolio; and
- You will get feedback about the achievement of technical and soft skills gained during this section of the program.

The project you are going to build for the Ruby on Rails capstone is based on a redesign of Twitter. You should follow the given design of the website, but you must personalize the content, i.e., it can be an app to share opinions about books, wedding business, fishing equipment, mushrooms - anything that you can share opinions about with people who follow you. Feel free to add your own app name and logo.

## 🔧 Built with<a name = "with"></a>

- Ruby on Rails (Version: 6.0.3.2)
- Ruby (Version: 3.0.0)
- Postgresql (version: 12)
- [Rspec](https://relishapp.com/rspec/rspec-rails/docs/model-specs)
- [Capybara](https://www.codewithjason.com/rails-testing-hello-world-using-rspec-capybara/)
- [Active Storage](https://www.microverse.org/blog/how-to-build-an-image-upload-feature-with-rails-and-active-storage)
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
$ git clone https://github.com/errea/Food-Hub-Mart-Twitter_Redesign.git
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
$ rails s
```

Open `http://localhost:3000/` in your browser.


## To run Test

~~~ruby
$ rails db:migrate RAILS_ENV=test
$ rspec --format documentation

~~~
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
</details> 



## Set up
* Open your terminal and locate the folder you want to clone the repository and follow the steps below to install

## Install

Run the following command into your terminal:

```console
run bundle install 

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

[Live Demo](https://limitless-tundra-20059.herokuapp.com/)

## Video to capstone project 
[Live video] ()

## Deployment
1) Git clone this repo and cd the to the `private_events` directory.
2) Run `rails server` in command line to open the application server in your browser via http://localhost:3000 or something similar
3) Run `heroku start`.
4) heroku run
5) heroku run rails db:migrate
6) git push heroku main
7) heroku run console

## Functionality

Logged in users can create, edit, and follow/unfollow other users.

1. The user logs in to the app, only by typing the username (a proper authenticated login is **not** a requirement).
2. The user is presented with the homepage (see the *Homepage* screenshot above) that includes:
    1. Left-side menu (includes only links to pages that are implemented).
    2. *Tweets* tab in the centre (skip *Photos* and *Videos* for this MVP).
    3. Right-side section with *Who to follow (*skip *Trending for* this MVP).
3. The *Tweets* section includes:
    1. Simple form for creating a tweet.
    2. List of all tweets (sorted by most recent) that display tweet text and author details.
4. The *Who to follow* section includes:
    1. List of profiles that are not followed by the logged-in user (ordered by most recently added).
5. When the user opens the profile page (see the *Userpage* screenshot above), they can see:
    1. Left-side menu (includes only links to pages that are implemented).
    2. Cover picture and *Tweets* tab in the centre (skip other tabs and *Tweet to user* form).
    3. Right-side section with *Profile detailed info.*
6. The *Profile detailed info* section includes:
    1. User photo.
    2. Button to follow a user.
    3. Stats: total number of tweets, number of followers and number of following users.
    4. List of people who follow this user.
7. At the end extend your MVP app with one simple feature of your choice.

## Thoughts

One of the main challenges I encountered /ran into was deciding how to upload pictures to the application

```ruby
class User < ApplicationRecord
  has_one_attached :image
  has_one_attached :cover_image

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 12 }
  validates :fullname, presence: true, length: { minimum: 5, maximum: 50 }

  validates :name, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
                                     #dimension: { width: 200, height: 200 }
  validates :cover_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: { min: 800, max: 2400 },
                                                  height: { min: 600, max: 1800 }, message: 'is not given between dimension' }
  #validates_acceptance_of :image, :cover_image,
                          #content_type: ['image/jpg', 'image/jpeg', 'image/png']
  
  
  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followings, class_name: 'Following', foreign_key: 'follower_id'
  has_many :follows, through: :followings, source: :followed
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :inverse_followings, source: :follower

  def who_to_follow
    User.where.not(id: id).where.not(id: follows).order('created_at DESC')
  end
end
# much faster using Active storage with it's validations 

```



## Testing

We wrote tests for `spec/controllers/user_controller_spec.rb`, and  `spec/models/*` using the `shoulda-matchers`, `rails-controller-testing`, and `factory-bot-rails` gems. In projects where I wrote my own authorization I had been using this helper method to stub methods related to authentication:

```ruby
RSpec.describe User, type: :model do
  describe 'Association' do
    it { should have_many(:opinions) }
    it { should have_many(:comments) }
    it { should have_many(:follows) }
    it { should have_many(:followers) }
  end

  describe 'Validation' do
    it { should validate_length_of(:username).is_at_least(3) }
    it { should_not validate_length_of(:username).is_at_least(2) }
    it { should validate_length_of(:fullname).is_at_most(20) }
    it { should_not validate_length_of(:fullname).is_at_least(3) }
    it { should validate_uniqueness_of(:username) }
  end
end
end
```


```ruby
RSpec.feature 'Users', type: :feature do
  before :each do
    @usr1 = User.create(username: 'errea', fullname: 'Eringozi Okereafor')
    @usr2 = User.create(username: 'twister', fullname: 'Wingsform')
    visit '/sign_in'
    fill_in 'session_username', with: 'errea'
    click_button 'Login'
  end

  it 'visit own profile page' do
    visit profile_path(@usr1.username)
    expect(page).to have_text('ALL FOODS SUGGESTED BY ERINGOZI OKEREAFOR')
  end

  it 'visit other profile page' do
    visit 'users/twister'
    expect(page).to have_text('ALL BOOKS SUGGESTED BY WINGSFORM')
  end

  it 'follow a user which has profile page open' do
    visit 'users/twister'
    expect(page).to have_text('0 Following')
    find('a.follow_me').click
    expect(page).to have_text('1 Following')
  end

  it 'should logout' do
    click_link 'Sign out'
    expect(current_path).to eql(sign_in_path)
  end
end
```
## Errors and solutions
```ruby
##coming soon still doing a compilation
```


## Screenshot <a name = "sc"></a>

### Home Page


## Screenshots

For those who are not patient, here are a couple of screenshots of what it looks like

<p float = 'left'>
  <img src="img/food_mart1a.png" alt="Private events home page" width="500" height="300">
  <img src="img/food_mart1a.png" alt="Private events event card" width="500" height="300">
</p>
  

</details>  

## ✒️  Authors <a name = "author"></a>

👤 **Eri**

- Github: [@errea](https://github.com/errea)
- Twitter: [@Erreakay](https://github.com/errea)
- Linkedin: [Eri Okereafor](https://www.linkedin.com/in/eri-ngozi-okereafor/)
  
## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/errea/Food-Hub-Mart-Twitter_Redesign/issues)
## 👍 Show your support

Give a ⭐️ if you like this project!
- Design Idea by: [Gregoire Vella](https://www.behance.net/gregoirevella)

- Microverse: [@microverse](https://www.microverse.org/)

## Acknowledgments

- Microverse

## 📝 License

This project is [MIT](./MIT.md) licensed.


