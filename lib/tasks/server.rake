task :pstart do
  sh 'RAILS_ENV=production passenger start -p6111 -d'
end

task :pstop do
  sh 'passenger stop -p6111'
end

task :start do
  sh 'unicorn -p3000'
end

task :log do
  sh 'tail -fn250 log/development.log'
end

task :plog do
  sh 'tail -fn1000 log/production.log'  
end