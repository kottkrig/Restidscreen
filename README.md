# Restid

An e-ink screen that displays departure time of relevant Västtrafik trips.

## Quick start

Add api key and secret from Västtrafik to `./config/secret.exs`

```bash
cp ./config/secret.example.exs ./config/secret.exs
```

Install dependencies

```bash
set -x MIX_TARGET host
mix deps.get
```

Start application in interactive mode

```bash
iex -S mix
```

## Acknowledgments

- [An eInk display with Nerves & Elixir - Getting started with Inky](https://underjord.io/an-eink-display-with-nerves-elixir.html), thank you @lawik for a great resource that got me started with Nerves and Scenic