resource "datadog_security_monitoring_rule" "detection_rule" {
  name = "Custom application impossible travel"
  has_extended_title = true
  message = templatefile("messages/impossible_travel.md", {})
  enabled = true

  query {
    query           = "source:python"
    aggregation     = "geo_data"
    group_by_fields = ["@username"]
    metric          = "@network.client.geoip"
  }

  case {
    status        = "high"
    notifications = ["@${var.user_email}"]
  }

  options {
    detection_method = "impossible_travel"
    evaluation_window   = 900
    keep_alive          = 3600
    max_signal_duration = 86400

    impossible_travel_options {
      baseline_user_locations = true
    }
  }

  tags = ["type:impossible-travel"]
}