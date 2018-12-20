# README

## Setup

### Ruby Version

Ruby version 2.5.1

### Seeding the Database

Product seedfile for development has not been created yet. Products rely on the Printful API in production.

Running `Sync::Products.perform` from the command line will fill the product tables (if the API is set up correctly)

### Testing

Tests are run automatically using Travis CI

## Contributing

* Clone the repo
* Create a feature branch
* Impliment the feature and ensure tests pass, and new test coverage is created if needed
* Open a Pull Request
* If the PR is addressing a specific issue, link to the issue with `fixes #` in the description of the PR
