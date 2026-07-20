# Vanilla Site

It's a site, written in Vanilla HTML+CSS. It's about me.

Proof that you don't need to learn complicated web frameworks to build a simple but cool website.

I also used Eleventy to make a blog page! I'll be writing some stuff there soon :)


## How 2 Run?
You must have:
* Node/NPM

1. Clone it!
```bash
git clone https://github.com/Snowflake6413/vanillasite
```

2. Enter dir
```bash
cd vanillasite
```

3. Install dependencies
```bash
npm i
```

4. Run local server
```bash
npx @11ty/eleventy --serve
```

5. Profit.


# Run with Docker + Cloudflare Tunnel

The site builds into a small nginx image and is exposed via a Cloudflare Tunnel
sidecar (no ports opened on your host/router).

### 1. Create a tunnel
In the [Cloudflare Zero Trust dashboard](https://one.dash.cloudflare.com/):
**Networks → Tunnels → Create a tunnel → Cloudflared**. Give it a name, then
copy the **tunnel token**. Under the tunnel's **Public Hostnames**, add your
domain and point it at the service `http://web:80`.

### 2. Configure the token
```bash
cp .env.example .env
# edit .env and paste your TUNNEL_TOKEN
```

### 3. Build and run
```bash
docker compose up -d --build
```

That's it — the site is live at your configured hostname. To browse locally too,
uncomment the `ports:` block under `web` in `docker-compose.yml`.

### Updating content
After changing the site, rebuild and redeploy:
```bash
docker compose up -d --build
```


# LICENSE
This repo is licensed under the MIT License. Read more in [LICENSE](LICENSE)
