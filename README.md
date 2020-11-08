# Lucky API Reference Project

This is a HTTP JSON API written using [Lucky](https://luckyframework.org) and the [Crystal](https://crystal-lang.org/) programming language. It acts as a place of reference to build similar API's that can be consumed by front end applications.

## Rationale

Below are some of the main criteria needed for a stable means of producing JSON API's:

- Blazing performance
- Low memory consumption
- Small final Docker images
- Fast "cold boot" startup times
- Productive development:
  - Excellent request validation
  - Excellent JSON response serialisation support
  - DB ORM & migrations
  - Easily tested
- Secure out of the box
- Support for Many-to-Many DB connections e.g. A single API can connect to serveral DB instances and a single DB instance can have several API's connect to it

**Lucky, Crystal and Docker combined tick all of the boxes!**

## Setup

1. [Install required dependencies](https://luckyframework.org/guides/getting-started/installing#install-required-dependencies)
1. Update database settings in `config/database.cr`
1. Run `script/setup`
1. Run `lucky dev` to start the app locally at: `http://127.0.0.1:5000`

## Docker

Crystal compiles this entire project down to a static binary which is then copied to an Alpine Linux Docker image for production. The image weights in at `~25MB` and starts almost instantly from a cold boot; perfect for deploying to a K8s cluster or to a "scale to zero" cloud platform e.g. Google's Cloud Run. Check out the included Docker tasks and `Dockerfile` for details.

## Learning Lucky

Lucky uses the [Crystal](https://crystal-lang.org) programming language. You can learn about Lucky from the [Lucky Guides](https://luckyframework.org/guides/getting-started/why-lucky).
