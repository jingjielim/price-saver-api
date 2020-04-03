# Rails API for Price Saver

Backend Rails API for grocery price tracking app

### Technologies

- React
- Ruby on Rails
- Bootstrap
- JavaScript

### Frontend App
- [Client Repo](https://github.com/jingjielim/price-saver)
- [Client deployed](https://jingjielim.github.io/price-saver/)

## Setup
1. Fork and clone this repository.
2. Install dependencies with `bundle install`.

## ERD
![PriceSaver ERD](https://user-images.githubusercontent.com/16698481/78325596-12b16e80-7546-11ea-8c12-c08d9c17ccd1.png)

## API URL

```js
production: 'https://frozen-woodland-37664.herokuapp.com/'
```
## API End Points

### User resource

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| DELETE | `/sign-out`            | `users#signout`   |
| PATCH  | `/change-password`     | `users#changepw`  |

### Price resource
| Verb   | URI Pattern     | Controller#Action |
|--------|-----------------|-------------------|
| GET    | `/prices`       | `prices#index`    |
| GET    | `/prices/:id/`  | `prices#show`     |
| POST   | `/prices`       | `prices#create`   |
| DELETE | `/prices/:id`   | `prices#destroy`  |
| PATCH  | `/prices/:id`   | `prices#update`   |


### Item resource
| Verb   | URI Pattern     | Controller#Action |
|--------|-----------------|-------------------|
| GET    | `/items`       | `items#index`    |
| GET    | `/items/:id/`  | `items#show`     |
| POST   | `/items`       | `items#create`   |
| DELETE | `/items/:id`   | `items#destroy`  |
| PATCH  | `/items/:id`   | `items#update`   |

### Store resource
| Verb   | URI Pattern     | Controller#Action |
|--------|-----------------|-------------------|
| GET    | `/stores`       | `stores#index`    |
| GET    | `/stores/:id/`  | `stores#show`     |
| POST   | `/stores`       | `stores#create`   |
| DELETE | `/stores/:id`   | `stores#destroy`  |
| PATCH  | `/stores/:id`   | `stores#update`   |
