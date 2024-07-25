tf-servicelevel = {
  "0" = {
    guid : "NDQ5NTA4N3xJTkZSQXxOQXwxNDIwMjUyMDQzMTU0NjE5NjI",
    name : "Service Level",
    account_id = 4495087
    from       = "systemsample"
    function   = "COUNT"
    where      = "diskUsedPercent IS NOT NULL"
    from       = "systemsample"
    function   = "COUNT"
    where      = "diskUsedPercent > 90"
    target     = 90
    count      = 1
    unit       = "DAY"
  }
}