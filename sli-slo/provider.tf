terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.40.1"
    }
  }
}

provider "newrelic" {
  account_id = 4495087
  api_key    = "NRAK-16ZO0Z8XD8YICJGY22TZ5NJACIZ"
}