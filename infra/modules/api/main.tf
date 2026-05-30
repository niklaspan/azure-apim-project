resource "azurerm_api_management_api" "this" {
  name                = "ml-api"
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  revision            = "1"
  display_name        = "ML Prediction API"
  path                = "predict"
  protocols           = ["https"]
}

resource "azurerm_api_management_api_operation" "predict" {
  operation_id        = "post-predict"
  api_name            = azurerm_api_management_api.this.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  display_name        = "Post prediction request"
  method              = "POST"
  url_template        = "/predict"
}

resource "azurerm_api_management_api_policy" "traffic_policy" {
  api_name            = azurerm_api_management_api.this.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name

  xml_content = <<XML
<policies>
  <inbound>
    <base />
    <choose>
      <when condition="@("${var.traffic_mode}" == "full_cloud")">
        <set-backend-service base-url="${var.databricks_url}" />
      </when>
      <when condition="@("${var.traffic_mode}" == "full_local")">
        <set-backend-service base-url="${var.local_server_url}" />
      </when>
      <otherwise>
        <set-variable name="rand" value="@(new Random().Next(1, 101))" />
        <choose>
          <when condition="@((int)context.Variables["rand"] <= ${var.cloud_traffic_percent})">
            <set-backend-service base-url="${var.databricks_url}" />
          </when>
          <otherwise>
            <set-backend-service base-url="${var.local_server_url}" />
          </otherwise>
        </choose>
      </otherwise>
    </choose>
  </inbound>
  <backend>
    <base />
  </backend>
  <outbound>
    <base />
  </outbound>
  <on-error>
    <base />
  </on-error>
</policies>
XML
}