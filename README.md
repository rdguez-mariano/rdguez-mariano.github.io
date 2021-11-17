# Mariano Rodriguez's website

## Requirements
```bash
sudo apt-get update
sudo apt-get -y install make ruby-full build-essential zlib1g-dev
```

## Define Ruby's location for packages

An add the following lines to the file `.bashrc`,

```
# Ruby exports
export GEM_HOME=$HOME/.gems
export PATH=$HOME/.gems/bin:$PATH
```


## Prepare for launching the local web server

Install the jekyll and bundler packages,

```bash
gem install jekyll bundler
```

and on the root folder of this repo do,

```bash
bundle install
```

## Launch the local server

```bash
bundle exec jekyll serve
```
