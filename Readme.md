# Traefik Reverse Proxy 

Minimal Traefik stuff to set up ur networking on a single docker host.

## Install
- Clone the repository
- Create a docker network and name it proxy: `docker network create proxy`
- docker-compose up
- Monitor available at: http://monitor.localhost/  (user admin, pass: admin)
- Expose containers using stuff like:
```yaml
    myservice:
      labels:
      traefik.port: 80
      traefik.frontend.rule: Host:api.localhost
      traefik.docker.network: proxy
      traefik.enable: true
    networks:
      - proxy
```

## Facts
- Use *.localhost rules on your containers and services to 'expose' them.
- `proxy` is the name of the external network
- Change monitor user/pass by editing `conf/traefik.yaml`

##  Change monitor passord
- Use Apache tools: `htpasswd -nb admin my_not_so_secret_pass`
- Or some online editor [like this one](https://www.web2generators.com/apache-tools/htpasswd-generator)

## ToDo
- Lots..
- Cleanup
- Dynamic network name
- Dynamic domain
- Move some stuff to Env vars
- HTTPS: Basic/"local" SSL certificates for local development
- HTTPS: Let's encrypt
- Build / makefiles
- Lots more

## About
By [Daniel Morales](https://daniel.uy)
License: Released under the  [MIT license](https://github.com/danielm/uploader/blob/master/LICENSE.txt)
