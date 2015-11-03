Dashing.scheduler.every '1s' do
  Dashing.send_event('product',   { current: rand(100) })
end
