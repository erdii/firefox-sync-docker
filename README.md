# Firefox Sync Server in a Docker Container

Firefox Sync is great and in a portable Docker Container it's even greater!


## Requirements

* postgresql ( a new version )


## Setup

* adapt `syncserver.ini` to fit your needs
  * `public_url` to match your internet facing URL e.g `public_url = http://yourdomain.com:5000/`
  * `sqluri` to match your postgres connectionstring e.g `sqluri = postgresql://user:pass@server/db`
  * `secret` has to be generated e.g by typing `head -c 20 /dev/urandom | sha1sum`
  * `allow_new_users` is a boolean


## Client Setup

Go to `about:config` and change `identity.sync.tokenserver.uri` to `http://yourdomain.com:5000/token/1.0/sync/1.5`
