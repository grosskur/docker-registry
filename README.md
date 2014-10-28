# Dockerized Docker registry

Differences from the standard `registry` repo:

* Installs all dependencies including `docker-registry` using `pip`
* Removes config for storage backends other than `s3`
* Uses `/app` as the application directory
