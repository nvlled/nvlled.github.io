# nvlled.github.io
This static site is built using [lua DSL and redbean](https://github.com/nvlled/moon-temple).

# Development
```sh
$ ./moontpl serve src
```


# Building
```sh
$ ./moon-temple build src output
```

# Deploying to github pages
```sh
$ git add pages
$ git commit -m "Make changes"
$ git push
```

## Note: 
No need to commit the build files, github actions will automatically build the site on push.
See the file __.github/workflows/build-site.yaml__ for the configuration.
