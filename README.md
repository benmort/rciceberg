# VBox -> Name to change
# MVP Todo
- Fix payment gate ways (see issue [#24](https://github.com/benmort/rciceberg/issues/24))
- Orders dashboard
- Finalize Name

# Business Todo
- Business Name - for "Trading as" - this will need to be added to the partnership

# Long Term Todo
- App with cycle tracker
- Branded tampons/pads/panty liners
- Move towards organic and sustainable products "good for you and the environment"
- add subscriptions (cycle (days) based instead of just plain monthly)

# Name ideas?
- Monthly Club
- Monthly Best Friend

# Marketing Ideas
- Social Media, specifically:
  - Instagram and Facebook ads
  - Set up an account on both sharing daily "goss"

# Target Audience
- Mid to Late Teenage Girls
- Mothers to their daughters girls

# Setup
- Clone Repo
- Run `bundle install`
  - If you get a `pg` Gem error, comment out the inclusion of `pg` within the `Gemfile`

- Run `rake db:migrate`
- Add a hosts file entry for `dev.rciceberg.com` to point to `127.0.0.1` and `0.0.0.0`
- Run `rails c` then run this command in the Rails dev console:
- Tenant.create :name => "<placeholder>", :domain => "rciceberg.com", :subdomain => "dev"
- Create a new product in `rails c`:
- Product.create :name => "T Delivered Monthly", :description => "Our box comes with all you need when you need it most", :price => 19.95, :stock => 9999999, :tenant_id => 1, :description_two => "Description two"
- Run `rails server`
- Hit `dev.rciceberg.com:3000` to test
- Add an admin:
  - Browse to `/admins/sign_up`
  - add email and password

# Testing payment
We use Stripe, so use the credit card details listed [here](https://stripe.com/docs/testing)
