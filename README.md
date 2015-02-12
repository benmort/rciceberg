RC Iceberg
====

Setup:

* Clone Repo
* Run `bundle install`
  * If you get a `pg` Gem error, comment out the inclusion of `pg`
* Run `rake db:migrate`
* Add a hosts file entry for `dev.rciceberg.com` to point to `127.0.0.1` and `0.0.0.0`
* Run `rails c` then run this command in the Rails dev console:
```
Tenant.create :name => "iceberg", :domain => "rciceberg.com", :subdomain => "dev"
```
* Hit `dev.rciceberg.com:3000` to test
