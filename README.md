# Magic 8 Ball :8ball:

![Magic 8 Ball](http://learnyousomeerlang.com/static/img/magic-8-ball.png)

This is a direct port of the Magic 8 Ball application in Learn You Some Erlang.

If you want to play with this, make sure you replace all the hostnames in the `config/x.config` folder:

```
[{kernel,
	[{distributed, [{m8_ball,
									 5000,
									 [a@hostname, {b@hostname, c@hostname}]}]},
	{sync_nodes_mandatory, [b@hostname, c@hostname]},
	{sync_nodes_timeout, 30000}
]}].
```

To get the hostname, do something like this:

```
% hostname -s
benjamintan
```

Open 3 different terminals, and on each of them, run these commands:

```
% iex --sname a --erl "-config config/a.config" -S mix
% iex --sname b --erl "-config config/b.config" -S mix
% iex --sname c --erl "-config config/c.config" -S mix
```

Playing with the application:

```
iex(c@benjamintan)2> M8Ball.ask "Will my wife lock me out tonight?"
```
