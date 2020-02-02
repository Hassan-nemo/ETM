# Etm

[![Build Status](https://travis-ci.org/assenvic/ETM.svg?branch=master)](https://travis-ci.org/assenvic/ETM)

Client side Implementation for the matrix 
This Project Implemented using a couple of patterns (clean archticture, Repository Pattern, Abstract Factory)

Also it was implemented in TDD style, so unit tests comes first using `Rspec` and `Travis` as CI
All the PRs Implemented into reviewable way:

1. [Gem Scaffolding, dockorizing and basic tools](https://github.com/assenvic/ETM/commit/6df93e0c7d1ffebac432bbb5faff193f41dac7f6)
2. [structuring basic entities contract](https://github.com/assenvic/ETM/pull/1)
3. [Add data loader/parsing helpers](https://github.com/assenvic/ETM/pull/2)
4. [Add Helpers to download, parse and extract files](https://github.com/assenvic/ETM/pull/3)
5. [Add reposistories for all reponses with entities](https://github.com/assenvic/ETM/pull/4)
6. [Add serialize, import and key_maker services ](https://github.com/assenvic/ETM/pull/5)
7. [Add the hacking program and basic logging](https://github.com/assenvic/ETM/pull/6)

## Installation

build the application and Start parsing Matrix data:

```bash
docker-compose up --build    
```

## Run Test cases
```bash
docker-compose run etm bundle exec rspec
```
