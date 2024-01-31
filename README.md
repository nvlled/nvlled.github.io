# nvlled.github.io
This static site is built using [lua DSL and redbean](https://github.com/nvlled/moon-temple).

# Development
```sh
$ ./moon-temple serve pages
```

## Note:
On Ubuntu, you may get an error **invalid CIL image** when running moon-temple.com.
This is caused by binfmt running moon-temple with wine.
To fix, disable the binfmt service:
```sh
sudo systemctl disable binfmt-support
```

# Building
```sh
$ ./moon-temple build pages output
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
