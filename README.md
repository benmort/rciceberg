[placeholder for name]
====

MVP Todo
===
* Finish Website
  * Update feel
  * Update colours
  * Update Sales pitch
  * Add pictures (chocolates on right side)
  * Mention the gifts in the sales pitch
  * Fix payment gate ways
  * add subscriptions
  * Mobile friendly
* Store bought pads/tampons/panty liners
* Decide on gifts/extras
* Finalize Name
* Subscription (cycle (days) based instead of just plain monthly)

Business Todo
===
* Partnership Agreement
* Equity Split
* Bank Account?
* ABN?
* Business Name?
  * for all of the above, can we use RCIceberg?

Long Term Todo
===
* App with cycle tracker
* Branded tampons/pads/panty liners
* Move towards organic and sustainable products "good for you and the environment"

Name ideas?
===
* Monthly Club
* Monthly Best Friend

Marketing Ideas
===
* Social Media, specifically:
  * Instagram and Facebook ads
  * Set up an account on both sharing daily "goss"
* Talk to Kyle to see if we can advertise on his site, depending on demographic

Target Audience
===
* Mid to Late Teenage Girls
* Mothers to girls

Setup
===

* Clone Repo
* Run `bundle install`
  * If you get a `pg` Gem error, comment out the inclusion of `pg` within the `Gemfile`
* Run `rake db:migrate`
* Add a hosts file entry for `dev.rciceberg.com` to point to `127.0.0.1` and `0.0.0.0`
* Run `rails c` then run this command in the Rails dev console:
```
Tenant.create :name => "<placeholder>", :domain => "rciceberg.com", :subdomain => "dev"
```
* Create a new product in `rails c`:
```
Product.create :name => "Test", :description => "test product desc", :price => 19.95, :stock => 100, :tenant_id => 1
```
* Run `rails server`
* Hit `dev.rciceberg.com:3000` to test
