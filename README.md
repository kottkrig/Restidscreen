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
