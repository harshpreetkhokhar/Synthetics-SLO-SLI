#Ping-Monitor
resource "newrelic_synthetics_monitor" "Ping-Monitor" {
  status           = "ENABLED"
  name             = "Ping-monitor-tf"
  period           = "EVERY_12_HOURS"
  uri              = "https://music.youtube.com/"
  type             = "SIMPLE"
  locations_public = ["AP_NORTHEAST_1"]

  treat_redirect_as_failure = true
  validation_string         = "success"
  bypass_head_request       = true
  verify_ssl                = true

}


#Browser-Monitor
resource "newrelic_synthetics_monitor" "Browser-monitor" {
  status           = "ENABLED"
  name             = "browser-monitor-tf"
  period           = "EVERY_12_HOURS"
  uri              = "https://music.youtube.com/"
  type             = "BROWSER"
  locations_public = ["AP_SOUTH_1"]

  enable_screenshot_on_failure_and_script = true
  validation_string                       = "success"
  verify_ssl                              = true
  runtime_type                            = "CHROME_BROWSER"
  runtime_type_version                    = "100"
  script_language                         = "JAVASCRIPT"
  device_type                             = "MOBILE"
  device_orientation                      = "LANDSCAPE"
}


#Broken-link
resource "newrelic_synthetics_broken_links_monitor" "Bronken-links" {
  name             = "Bronken-links-tf"
  uri              = "https://music.youtube.com/"
  locations_public = ["AP_SOUTH_1"]
  period           = "EVERY_12_HOURS"
  status           = "ENABLED"
  # runtime_type         = "NODE_API"
  # runtime_type_version = "16.10"
}


#private-location
resource "newrelic_synthetics_private_location" "Pvt-location" {
  description = "The private location"
  name        = "Private-location-tf"
}


#step-links
resource "newrelic_synthetics_step_monitor" "Step-Monitor" {
  name                                    = "Step-Monitor-tf"
  enable_screenshot_on_failure_and_script = true
  location_private {
    guid         = newrelic_synthetics_private_location.Pvt-location.id
    vse_password = "secret"
  }
  period               = "EVERY_12_HOURS"
  status               = "ENABLED"
  runtime_type         = "CHROME_BROWSER"
  runtime_type_version = "100"
  steps { #can add multiple step
    ordinal = 0
    type    = "NAVIGATE"
    values  = ["https://google.com"]
  }
  steps {
    ordinal = 1
    type    = "CLICK"
    values  = ["button#search"] # Example selector
  }

}


#ssl-verification
resource "newrelic_synthetics_cert_check_monitor" "Cert-Check-tf" {
  name                   = "Cert-Check-tf"
  domain                 = "https://google.com"
  locations_public       = ["AP_SOUTH_1"]
  certificate_expiration = "10"
  period                 = "EVERY_12_HOURS"
  status                 = "ENABLED"
  # runtime_type           = "NODE_API"
  # runtime_type_version   = "16.10"
}


#Scripted-browser
resource "newrelic_synthetics_script_monitor" "scripted-monitor-tf" {
  status                                  = "ENABLED"
  name                                    = "scripted-monitor-1"
  type                                    = "SCRIPT_BROWSER" #SCRIPT_API
  locations_public                        = ["AP_SOUTH_1"]
  period                                  = "EVERY_12_HOURS"
  enable_screenshot_on_failure_and_script = false
  script                                  = "$browser.get('https://google.com')"
  runtime_type_version                    = "100"
  runtime_type                            = "CHROME_BROWSER"
  script_language                         = "JAVASCRIPT"
}

