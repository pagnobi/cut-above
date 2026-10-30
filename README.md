# Cut Above

A cartoon lawn-mowing game: cut grass, haul bags of clippings for cash, upgrade from rusty scissors to a laser mower, and mow all six zones to 100%. Solo or with friends in multiplayer lobbies.

**Play:** https://pagnobi.github.io/cut-above/

## Files

- `index.html` — the page GitHub Pages serves. Built from the source; don't edit it by hand.
- `src/game.html` — the game's source, also published as a claude.ai artifact (claude.ai adds the page skeleton itself).
- `build.sh` — rebuilds `index.html` from `src/game.html`. Run it after every change, then commit both.
- `.nojekyll` — tells GitHub Pages to serve the files as they are.

## Multiplayer

Players type the same lobby name to play together. Whoever creates a lobby picks its mode:

- **Co-op** — one shared wallet. Tools, upgrades, robots and drop-offs are shared.
- **Shared map, own wallets** — everyone mows the same map but earns and spends their own money.

How players connect depends on where the game is opened:

| Where | Connection | Lobby saved |
|---|---|---|
| claude.ai artifact | The artifact's live room | In the artifact's shared store |
| GitHub Pages (or any HTTPS host) | Browser to browser (WebRTC through Trystero's free public Nostr relays, no server) | In each player's browser; the copy with the most mowing wins when players meet |
| Any page with `?net=local` | Tabs in the same browser (for testing) | In that browser |

Peer-to-peer needs HTTPS. A few strict corporate or mobile networks block direct browser connections; players on those networks won't be able to join peer-to-peer lobbies.

## Publish on GitHub Pages

1. Run `./build.sh` and push to `main`.
2. One time only: on GitHub, **Settings → Pages → Build and deployment → Source: Deploy from a branch**, pick `main` and `/ (root)`, and save.
3. The game updates at https://pagnobi.github.io/cut-above/ a minute or so after each push.
