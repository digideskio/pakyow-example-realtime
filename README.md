This is a Pakyow app demonstrating websockets in Pakyow using the pakyow-realtime library.

# Getting Started

Start the app server:

  `bundle exec pakyow server`

You'll find the app running at [http://localhost:3000](http://localhost:3000).

# Playing w/ WebSockets

This example app demonstrates subscribing a client to a channel and pushing a message down a channel to connected clients. It also includes some Javascript code to demonstrate how to establish a websocket connection from the client and sending messages to the server. Here are some things to try.

## Sending a message to a client.

With a browser open to the [homepage](http://localhost:3000), execute the following in curl:

```
curl http://127.0.0.1:3000/push?msg=hello
```

Open up the Javascript console in your browser and you'll see a message that looks something like:

```
Object {payload: "hello", channel: "foo"}
```

Here's what happened. On the first request, the client was subscribed to the `foo` channel. Once the view was rendered in the browser, a websocket connection was established with the server. When a message was sent via the `push` route using curl, it was pushed down to the subscribed client and logged to the screen in the `onmessage` handler defined in the Javascript found at the bottom of `index.html`.

Try it with several browser windows and you'll see the message in each one!

## Calling a route from the client.

With a browser open to the [homepage](http://localhost:3000), open the Javascript console and execute this bit of Javascript:

```javascript
sendMessage(
  {
    action: 'call_route',
    uri: '/greet/bryan',
    method: 'get'
  }, function (response) {
    console.log(response);
  }
);
```

The client will sent a message to the server over the websocket, calling a route just as if it was an HTTP request. Once the route is finished executing, the response will be sent back to the client. You'll see the response logged in the console:

```
body: Object
  greeting: "hello bryan"
headers: Object
  Content-Type: "application/json"
id: "c51016db-ea51-db17-ae58-3616716b0cdb"
status: 200
```

Calling routes this was has much less latency than HTTP requests since the websocket connection is already established. It's also more convenient than using AJAX, since all front-end code can be written in context of websockets.

# Next Steps

Find out more about pakyow-realtime [here](https://github.com/pakyow/pakyow/tree/master/pakyow-realtime).
