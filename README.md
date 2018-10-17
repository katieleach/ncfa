# NCFA

```
bundle
rails db:create db:migrate
yarn install
rails s
```

in a separate window...

```
webpack-dev-server
```

## Seeding the DB

Use...

```
rake 'comfy:cms_seeds:import[folder-name, site-identifier]'
```
See the Comfy docs (2.0) for details https://github.com/comfy/comfortable-mexican-sofa/wiki/Docs:-CMS-Seeds
