task "db:reseed" do
  `rake db:drop && rake db:migrate`
  `rake db:seed`
end
