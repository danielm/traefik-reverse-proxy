# Traefik Reverse Proxy

Minimal Traefik stuff to set up ur networking on a single docker host. Supports LetsEncrypt certificates.

## Install
- Clone the repository
- Create a docker network and name it proxy: `docker network create traefik-proxy`
- create `.env` from `.env.default`
- create `conf/.htpasswd` from `conf/.htpasswd.default`
- edit `conf/traefik.prod.yml` and change the `email` address used while generating certificates
- Expose containers using stuff like:
```yaml
    myservice:
      labels:
        - "traefik.enable=true"
        - "traefik.http.routers.my-app.entrypoints=web"
        - "traefik.http.routers.my-app.rule=Host(`my-app.localhost`)"
    networks:
      - traefik-proxy
```
- Use `websecure` entrypoint for SSL support:
```yaml
    myservice:
      labels:
        - "traefik.enable=true"
        - "traefik.http.routers.my-app.entrypoints=websecure"
        - "traefik.http.routers.my-app.rule=Host(`mystartup.com`)"
    networks:
      - traefik-proxy
```

## Commands
- All comands support ENV=prod/dev  (dev is default)
- `$ make up` to run in development mode (non-https)
- `$ ENV=prod make up` to run in production mode
- `$ ENV=prod make bulid` to run in production mode
- `$ ENV=prod make down` to run in production mode
- `$ ENV=prod make stop` to run in production mode
- `$ ENV=prod make ps` to run in production mode

## Facts
- Use *.localhost rules on your containers and services to 'expose' them.
- `traefik-proxy` is the name of the external network
- By defaul when local monitor available at: http://traefik.localhost/  (user admin, pass: admin)

##  Change monitor password
- Use Apache tools: `htpasswd -nb admin my_not_so_secret_pass`
- Or some online editor [like this one](https://www.web2generators.com/apache-tools/htpasswd-generator)

## About
By [Daniel Morales](https://daniel.uy)
License: Released under the  [MIT license](https://github.com/danielm/uploader/blob/master/LICENSE.txt)
