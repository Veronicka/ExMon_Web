# ExMon

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


#### Comandos úteis

- terminal elixir project
```
$ iex -S mix
```

- create phoenix project
```
$ mix phx.new nome-projeto
```

- create bd
```
$ mix ecto.create
```

- create migration
```
$ mix ecto.gen.migration nome-da-migration
```

- execute migration
```
$ mix ecto.migration
```

- back migration
```
$ mix ecto.rollback
```

- add dependency
```
$ mix deps.get
```

- see routes
```
$ mix phx.routes
```

- run tests
```
$ mix test
```