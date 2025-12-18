# Betterboxd

A Letterboxd clone written in Ruby on Rails 8. The main goal is to test out
building a full stack app the Rails way, without adding dependencies like React,
etc. We're also using the authentication provided by the [Rails 8 authentication
generator](https://guides.rubyonrails.org/security.html#authentication).

## Requirements

- Ruby 3.4.7
- Postgres

## Installation

Install Ruby and Postgres on your machine if you don't already have them.

Run `bundle` to install dependencies.

Run `./bin/rails db:setup` to create the database and seed it with dev data.

## Dev

Start the Rails server using the Procfile.dev with Foreman by running `./bin/dev`.
