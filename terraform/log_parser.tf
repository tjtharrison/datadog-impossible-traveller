resource "datadog_logs_custom_pipeline" "demo_pipeline" {
  filter {
    query = "source:python"
  }
  name       = "Demo pipeline"
  is_enabled = true
  processor {
    grok_parser {
      is_enabled = true
      name       = "My app"
      samples    = [
        "{\"time\":\"2023-07-10 20:30:11\", \"name\": \"root\", \"level\": \"INFO\", \"message\": \"Generating logs..\" \"username\": \"tjtharrison\", \"source_ip\": \"0.0.0.0\"}",
      ]
      source = "message"

      grok {
        support_rules = ""
        match_rules = "autoFilledRule1 \\{\"time\"\\:\"%%{date(\"yyyy-MM-dd HH:mm:ss\"):date}\",\\s+\"name\"\\:\\s+\"root\",\\s+\"level\"\\:\\s+\"%%{word:level}\",\\s+\"message\"\\:\\s+\"Generating\\s+logs\\.\\.\"\\s+\"username\"\\:\\s+\"%%{word:username}\",\\s+\"source_ip\"\\:\\s+\"%%{ipv4:source_ip}\"\\} \\n"
      }
    }
  }
  processor {
    geo_ip_parser {
      is_enabled = true
      name       = "GeoIP-parser"
      sources    = [
        "source_ip",
      ]
      target = "network.client.geoip"
    }
  }

}