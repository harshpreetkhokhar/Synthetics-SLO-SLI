terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = ">=3.0.0" # Update this line
    }
  }
}

provider "newrelic" {
  account_id = "4495087"
  api_key    = "NRAK-16ZO0Z8XD8YICJGY22TZ5NJACIZ" # Secure your API key properly in real scenarios
  #  region     = "US"          # Valid regions are US and EU
}
