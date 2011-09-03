task :pstart do
  sh 'cat start.sh | bash'
end

task :pstop do
  sh 'cat stop.sh | bash'
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