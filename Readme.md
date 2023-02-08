# Traefik Reverse Proxy 

Minimal Traefik stuff to set up ur networking on a single docker host.

## Install
- Clone the repository
- Create a docker network and name it proxy: `docker network create traefik-proxy`
- create `.env` from `.env.default`
- create `conf/.htpasswd` from `conf/.htpasswd.default`
- docker-compose up
- Monitor available at: http://traefik.localhost/  (user admin, pass: admin)
- Expose containers using stuff like:
```yaml
    myservice:
      labels:
        - "traefik.enable=true"
        - "traefik.http.routers.my-app.entrypoints=http"
        - "traefik.http.routers.my-app.rule=Host(`my-app.localhost`)"
    networks:
      - traefik-proxy
```

## Facts
- Use *.localhost rules on your containers and services to 'expose' them.
- `traefik-proxy` is the name of the external network

##  Change monitor password
- Use Apache tools: `htpasswd -nb admin my_not_so_secret_pass`
- Or some online editor [like this one](https://www.web2generators.com/apache-tools/htpasswd-generator)

## ToDo
- HTTPS: Basic/"local" SSL certificates for local development
- HTTPS: Let's encrypt
- Build / makefiles
- Lots more

## About
By [Daniel Morales](https://daniel.uy)
License: Released under the  [MIT license](https://github.com/danielm/uploader/blob/master/LICENSE.txt)
