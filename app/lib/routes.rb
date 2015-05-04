Pakyow::App.routes do
  default do
    socket.subscribe(:foo)
  end

  get 'push' do
    socket.push(params[:msg], :foo)
  end

  get 'unsub' do
    socket.unsubscribe(:foo)
  end

  get 'greet/:name' do
    res.body = { greeting: "hello #{params[:name]}" }
  end
end
