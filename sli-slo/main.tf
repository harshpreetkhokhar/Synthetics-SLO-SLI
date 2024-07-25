resource "newrelic_service_level" "service-level" {
  for_each = var.tf-servicelevel
  guid     = each.value.guid
  name     = each.value.name

  events {
    account_id = each.value.account_id
    valid_events {
      from = each.value.from
      select {
        function = each.value.function
      }

      where = each.value.where
    }
    good_events {
      from = each.value.from
      select {
        function = each.value.function
      }
      where = each.value.where
    }
  }

  objective {
    target = each.value.target
    time_window {
      rolling {
        count = each.value.count
        unit  = each.value.unit
      }
    }
  }
}
