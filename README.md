# Factorio Servers v0.1

`Ruby 3.3.5`

Install Dependencies

```shell
bin/bundle install
```

Setup Database

```shell
bin/rails db:setup
```

Start server

```shell
bin/dev
```

## Configuration

n/a

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
  - [ ] Create Factorio user
  - [ ] Download Factorio version
  - [ ] Copy Config
  - [ ] Configure Factorio Server Instance
  - [ ] Copy Save or Create New World
  - [ ] Start Server
- [ ] Config Firewall
- [ ] Use Turbo to update Server show page dynamically during boostrap