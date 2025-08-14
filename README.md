# Factorio Servers v0.1

`Ruby 3.4.4`

Install Dependencies

```shell
bin/bundle install
```

Start server

```shell
bin/dev
```

## Configuration

### Hetzner API key
Add Hetzner API key to config/hetzner.yml.

### Database
```shell
createuser -d factorioservers
```

```shell
sudo -u postgres psql
ALTER USER factorioservers WITH PASSWORD 'factorioservers';
```

Add Datbase config to config/database.yml.

```shell
bin/rails db:setup
```

## Services (job queues, cache servers, search engines, etc.)

n/a

## Deployment instructions

n/a

## TODO

- [x] Create Server Model
- [x] Create Factorio Server Instance
- [x] Shutdown Factorio Server Instance
- [ ] Install Factorio server on server instance
  - [x] Bootstrap server instance
  - [x] Create Factorio user
  - [x] Download Factorio version
  - [x] Create New Map
  - [x] Start Server
  - [ ] Copy Config
  - [ ] Configure Factorio Server Instance
  - [ ] Copy Save or Create New World
- [ ] Config Firewall
- [x] Use Turbo to update Server show page dynamically during boostrap