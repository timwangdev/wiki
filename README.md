# Tim Wang's Wiki

This is my personal knowlage base. The wiki is built with [gollum](https://github.com/gollum/gollum).

The wiki website is deployed at [wiki.timwang.me](http://wiki.timwang.me).

Feel free to build your own wiki from this repository.

## Run this wiki via Docker

### Building the Docker image

* Clone the repository

```
git clone https://github.com/timwangdev/wiki.git wiki
```

Note: this repository is build with `--no-edit` and `--css` options. If you need different [gollum options](https://github.com/gollum/gollum#running), you should edit the `Dockerfile` at this step.

* Navigate to the folder that houses the Dockerfile, ~/wiki/

* Run the following command to build an image from the Dockerfile with a tagname of gollum

```
docker build -t gollum .
```

After the terminal is done working away, the console will say Successfully built with the image ID created.

### Running the Docker Container

* Now we'll spin up a container based on the image created

* Navigate to the folder of our git repository, ~/wiki/

* Run the following command to boot up our image tag-named gollum:

```
docker run -v `pwd`:/wiki -p 80:80 gollum
```

This will bind our current folder as a symlink to the container's /wiki folder and forward port 80 of the container to port 80. 

Note: the symlink and port forwarding can also be setup using the Kitematic GUI once the container is running.

### Using [nginx-proxy](https://github.com/jwilder/nginx-proxy)

* Make sure you have properly setup the nginx-proxy container

```
docker run -v `pwd`:/wiki -e VIRTUAL_HOST=wiki.example.com -e VIRTUAL_PORT=80 -p 14567:80 gollum
```

Or use this YAML file

```YAML
wiki:
  image: your-image-name
  restart: always
  ports:
  - 14567:80
  volumes:
  - /somedir/wiki:/wiki
  environment:
  - VIRTUAL_PORT=80
  - VIRTUAL_HOST=wiki.example.com
```

I'm using [Daocloud](http://www.daocloud.io/) to manage my containers, the configuration should be the same if you're using `docker-compose`.

## TODO

- [ ] Custom CSS
- [ ] Auto deploy when updated

## Contribution

Pull Requests and Issues for both content and deployment are welcome.

## LICENSE

Copyright © 2016 Yao Wang. Content is available under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/) unless otherwise noted.