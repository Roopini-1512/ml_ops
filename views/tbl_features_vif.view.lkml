# The name of this view in Looker is "Tbl Features Vif"
view: tbl_features_vif {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `tgs-internal-saige-sandbox-001.mlops_artifacts.tbl_features_vif`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Date" in Explore.

  dimension: date {
    type: string
    sql: ${TABLE}.Date ;;
  }

  dimension: feature_status {
    type: string
    sql: ${TABLE}.Feature_status ;;
  }

  dimension: features {
    type: string
    sql: ${TABLE}.Features ;;
  }

  dimension: vif_values {
    type: number
    sql: ${TABLE}.Vif_values ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_vif_values {
    type: sum
    sql: ${vif_values} ;;
  }

  measure: average_vif_values {
    type: average
    sql: ${vif_values} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
