# HTTP Basic Authentication - Demo

This is a small demo project in plain html and javascript to illustrate the **HTTP Digest** authentication process.

The goal is to access a private resource located at `https://m183.gibz-informatik.ch/api/httpDigestAuth`. Only these registered users are allowed to access the resource:

| Username    | Password      |
| ----------- | ------------- |
| `britney_s` | `hitMeBaby`   |
| `bon_jovi`  | `badMedicine` |
| `shakira`   | `hipsDontLie` |
| `tom_j`     | `sexbomb`     |

The basic authentication process is layed out in the javascript file [html/scripts/digestAuth.js](html/scripts/digestAuth.js). It is your task now to complete the implementation.

Additionally, there's a directory [`protected`](html/protected/) on the root level of the web host. Currently, the content within this directory is publicly available. It is your goal to protect this directory with HTTP digest authentication. Use the prepared (although currently empty) files [`.htaccess`](html/protected/.htaccess) and [`.htpasswd`](html/protected/.htpasswd) to establish HTTP digest authentication specifically for the `protected` directory.

## Resources

There are many resources you might like to use:

- In-depth Description and security considerations: [https://www.securitydrops.com/http-digest/](https://www.securitydrops.com/http-digest/)
- Wikipedia article on http digest authentication: [https://en.wikipedia.org/wiki/Digest_access_authentication](https://en.wikipedia.org/wiki/Digest_access_authentication)
- RFC 2617 (HTTP Authentication: Basic and Digest Access Authentication): [https://tools.ietf.org/html/rfc2617](https://tools.ietf.org/html/rfc2617)
- Example implementation in PHP: [https://gist.github.com/funkatron/949952/11c11ef47f8dab54722ee20dc33372b7417579a6](https://gist.github.com/funkatron/949952/11c11ef47f8dab54722ee20dc33372b7417579a6)

You are completely free to use any helpful documentation and/or reference implementations. However, (for pedagogical reasons) you are not allowed to use libraries and/or frameworks of any kind to complete this task!

## Running the Application

On the command line, navigate to the local clone of this repository and spin up the docker composition:

```bash
# From within your local clone of this repository:
docker compose up
```

This command will start up a composition with a single container. In this container an Apache webserver is running. You may now access the demo website in any browser at [http://localhost:8183](http://localhost:8183).

Incase you made changes to the apache configuration or in `.htaccess` and `.htpasswd` files respectively, you need to rebuild the docker image before starting the container. You can do this using the `--build` flag:

```bash
# Using the --build flag for rebuilding the container
docker compose up --build
```
