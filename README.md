# Adhesive

## Dev setup

``` shell
asdf install
mix deps.get
mix ecto.create # sorry about this, I should have created with --no-ecto
```

## The problem:

Run server:

``` shell
iex -S mix phx.server
```

Visit `localhost:4000`.

1. Click "Click here to go to page B"

2. Then on that page click "Click here to go to page B"

3. Repeat steps 1 and 2 as much as you like

Observe: The "count" in the top left gets reset.

This count is in a sticky live view (`AdhesiveWeb.StickyLive`) and should not be reset.

The count is reset because pages A and B have their routes in different "live sessions" in the router.

I do not know if this is expected behavior or a bug.
