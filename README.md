# Spot of Tea (take home challenge)

![ruby](https://img.shields.io/badge/Ruby-2.7.4-red)
![rails](https://img.shields.io/badge/Rails-5.2.8.1-red)
![rspec](https://img.shields.io/badge/RSpec-3.11.0-green)

## Table of Contents
  - [Table of Contents](#table-of-contents)
  - [Background](#background)
  - [Schema](#schema)
  - [Endpoints](#endpoints)
  - [Installation](#installation)
  - [Contributors](#contributors)

## Background

The Spot of Tea app serves as a Backend that receives requests for creating tea subscriptions for customers. 

## Schema

![image](https://user-images.githubusercontent.com/80866068/201160033-9f5dc782-84d0-4436-8618-c048200283f3.png)

## Endpoints

- Create a new subscription
```shell
GET /api/v1/subscription

params: { customer_id: @customer.id, 
                      tea_id: Tea.ids.sample,                            
                      subscription_title: 'Yummy tea',
                      subscription_price: '25.05',
                      subscription_frequency: '4'
}

```

- Cancel a subscription
```shell
PATCH /api/v1/subscription
params: {
          customer_id: 4, 
          subscription_id: 5,
} 
```

- See all subscriptions
```shell
PATCH /api/v1/subscription
params: {
          customer_id: 4
} 
```
## Installation

Note: You must also install and run the [WeTectives FE app](https://github.com/wetective/fe) for full functionality.

1. Clone this repository: On your local machine, open a terminal session and enter the following commands for SSH or HTTPS to clone the repo.

- Using SSH key <br>
```shell
$ git clone git@github.com:jaredhardinger/spot-of-tea.git
```

- Once cloned, you'll have a new local copy in the directory you ran the clone command in.

2. Change to the project directory: In terminal, use `$cd` to navigate to the project directory.

3. Install required Gems utilizing Bundler: <br>
- In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.
```shell
$ gem install bundler
```

- If Bundler is already installed or after it has been installed, run the following command.
```shell
$ bundle install
```

4. Database Migration<br>
- Before using the web application you will need to setup your databases locally by running the following command
```shell
$ rails db:{drop,create,migrate,seed}
```

5. Startup and Access<br>
- Finally, in order to use the web app you will have to start the server locally and access the app through a web browser.

```shell
$ rails s
```

## Contributors
|  | |
| --- | --- |
| Jared Hardinger | [GitHub](https://github.com/jaredhardinger) &#124; [LinkedIn](https://www.linkedin.com/in/hardinger/) |
