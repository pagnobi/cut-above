# Cut Above

A cartoon lawn-mowing game: cut grass, haul bags of clippings for cash, upgrade from rusty scissors to a laser mower, and mow all six zones to 100%. Solo or with friends in multiplayer lobbies.

**Play:** https://pagnobi.github.io/cut-above/

## Files

- `index.html` — the page GitHub Pages serves. Built from the source; don't edit it by hand.
- `src/game.html` — the game's source, also published as a claude.ai artifact (claude.ai adds the page skeleton itself).
- `build.sh` — rebuilds `index.html` from `src/game.html`. Run it after every change, then commit both.
- `.nojekyll` — tells GitHub Pages to serve the files as they are.

## Multiplayer

The host opens a lobby from the main menu and shares its 10-character code (like `K7M2Q-8F3XZ`). Friends type it under **Join a game**, wait in the lobby, and drop in when the host starts. The host picks the mode:

- **Co-op**: one shared wallet. Tools, upgrades, robots and drop-offs are shared.
- **Shared map, own wallets**: everyone mows the same map but earns and spends their own money.

A lobby holds up to 8 players. It closes when the host leaves, and the host can reopen it later from the same browser (**Resume lobby**).

How players connect depends on where the game is opened:

| Where | Connection | Lobby saved |
|---|---|---|
| claude.ai artifact | The artifact's live room | In the artifact's shared store, signed by the host |
| GitHub Pages (or any HTTPS host) | Browser to browser (WebRTC through Trystero's free public Nostr relays, no server) | In the host's browser |
| Any page with `?net=local` | Tabs in the same browser (for testing) | In the host's browser |

Multiplayer needs HTTPS. A few strict corporate or mobile networks block direct browser connections; players there are routed through the relays instead, which is slower.

### Cheating

There's no server, so what each player's own browser does can't be fully trusted. The game is built so that one player can't change anyone else's game:

- **Signed messages:** every player signs what they send with a key kept in their browser, so nobody can speak for another player.
- **The host's key:** the lobby code is a fingerprint of the host's key, so only the host can run the shared wallet, confirm purchases, spin the roulette wheel, run bosses or save the lobby.
- **Per-player credit:** in co-op the host keeps a record of each player's credit, built from the grass it saw them cut. Sales are paid only from that player's own credit, and only when they're standing on a drop-off pad.
- **Movement checks:** cuts, bag drops and hits on bosses only count close to where a player can really be. Players can't move faster than the fastest gear allows.

Solo games and own-wallet money live in each player's browser, and that player can edit them. That's a limit of having no server.

## Publish on GitHub Pages

1. Run `./build.sh` and push to `main`.
2. One time only: on GitHub, **Settings → Pages → Build and deployment → Source: Deploy from a branch**, pick `main` and `/ (root)`, and save.
3. The game updates at https://pagnobi.github.io/cut-above/ a minute or so after each push.
