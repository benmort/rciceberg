[placeholder for name]
====

Setup:

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

Todo
===
* Update feel
* Update colours
* Update Sales pitch
* Add pictures (chocolates on right side)
* Mention the gifts

Name ideas?
===
* Monthly Club
* Monthly Best Friend

Marketing Ideas
===
* Social Media

Target Audience
===
* Mid to Late Teenage Girls
* Mothers to girls
