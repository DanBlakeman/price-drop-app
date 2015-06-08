[![Build Status](https://travis-ci.org/DanBlakeman/price-drop-app.svg)](https://travis-ci.org/DanBlakeman/price-drop-app)
[![Coverage Status](https://coveralls.io/repos/DanBlakeman/price-drop-app/badge.svg)](https://coveralls.io/r/DanBlakeman/price-drop-app)

# Amazong

## Save money - get alerts when Amazon drops its price on products you pick!

![screenshot](/public/Screenshot.png)

## What is it?

Rails app made using TDD in less than 48 hours, lets you add Amazon products and a budget to the homepage, and visually see their price change on return visit and an alert if they are within your budget.

## USPs?

Users can paste any amazon link - Our backend will find and extract the correct product ID and query Amazon via API to get its best current price.

If for some reason the link cannot be parsed for product ID, user is informed, and the app will log the URL and alert admins to investigate reason.

On return visit a second API call is made and our frontend will display any price changes, and alert if they are within the budget you set.

## User Stories used to drive Dev
```
As a voyeuristic consumer
So that i can see products
I want to see products listed on the homepage

As a price motivated user
So that i can get a great deal
I'd like to paste an amazon url and give my budget

As a price motivated user
So that i can get a great deal
I want to see when i next visit if a product is within my budget

As a price motivated user
So that i can get a great deal
I want to see any price change even if product is not within my budget

As a passionate product owner
So that i can keep improving my web app
I'd like to keep a log of any URLs users give that could not be parsed.

As a fickle user
So that i can get a buzz
I want the app to look and behave gorgeously
```
## MVps celebrated:

  - Can add amazon link to homepage list, and state your budget

  - Backend parses link and can access current price using Amazon API

  - Can identify products that are in budget and highlight them

  - Saves original product price and shows difference on page load.

  - Styling with JQuery, Bootstrap, JS

## Thoughts and ideas for taking this further

Overall i thought this was a fab MVP.

The key problem that has arisen however is the limit at which we can make API calls.

We'd like to display 15 products on the homepage, but after around 8 calls a second Amazon will throttle API access.

I'd also like to make this social - so other users can comment on products you've added (perhaps showing you where else you could buy them).

And give users the ability to sign up, so that they can see only the products they've added, and receive email/text alerts when amazon makes a price change that brings them within budget.

To acheive both of these developments i'd like to look more into background proccessing of the API price checks. So they can be staggered, and checked without the need for a page load.

Overall though, i'm super happy with what we acheived in the 48 hour hackathon. I think it provides a strong and beautiful MVP that could be used by a consumer immediately.

## How to use?

### Run locally

clone and download this repo.
```
cd price-drop-app
rails s
```
open http://localhost:3000 in your favourite browser.

### Run tests

clone and download this repo.
```
cd price-drop-app
rspec
```

## Technologies
- Ruby on Rails - Expandable framework will allow us to add user accounts easily.
- JS - For displaying price changes and alerts.
- JQuery/Bootstrap/HAML/Sass - UI markup and styling.
- PostgreSQL - DB for storing products and original prices, and users budget.
- [Vacuum Gem](https://rubygems.org/gems/vacuum/versions/1.2.0) - access the Amazon API.

## How to contribute?

Always love to hear feedback! Simply send a pull request or an email with your thoughts.

I'd be fascinated to learn of other techniques for mass querying Amazon for prices (especially if does not involve screen scraping).

Thanks for reading,

Dan

