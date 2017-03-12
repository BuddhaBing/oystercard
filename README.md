# Oystercard Challenge

[![Build Status](https://travis-ci.org/treborb/oystercard.svg?branch=master)](https://travis-ci.org/treborb/oystercard)
[![codecov](https://codecov.io/gh/treborb/oystercard/branch/master/graph/badge.svg)](https://codecov.io/gh/treborb/oystercard)

## [Makers Academy](http://www.makersacademy.com) - Week 2 - Paired Programming Challenge

## Technologies
* [Ruby v2.3.3](https://www.ruby-lang.org/en/)
* [Sinatra](http://www.sinatrarb.com/)
* [Rspec](http://rspec.info/)
* [Capybara](https://github.com/teamcapybara/capybara)

## Jump To
* [User Stories](#user-stories)
* [Installation](#install)
* [Usage](#usage)
* [Tests](#tests)
* [Screenshots](#screenshots)

## The Brief

Build a Ruby program that replicates the functionality of an Oystercard

## <a name="user-stories">User Stories</a>

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## <a name="install">Installation</a>
```
$ git clone https://github.com/treborb/oystercard.git
$ cd oystercard
$ rvm use 2.3.3 --install --binary --fuzzy
$ gem install bundler
$ bundle
```

## <a name="usage">Usage</a>

#### Load up your favourite REPL (e.g. irb)

```
$ irb
```

#### In the REPL
```ruby
$ require "./lib/oystercard"
$ card = Oystercard.new
$ card.top_up(50)
$ card.touch_in
$ card.touch_out
```

## <a name="tests">Running the tests</a>
```
$ rspec
```
