# The name of this view in Looker is "Tbl Algorithms Performance"
view: tbl_algorithms_performance {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `tgs-internal-saige-sandbox-001.mlops_artifacts.tbl_algorithms_performance`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Algorithm" in Explore.

  dimension: algorithm {
    type: string
    sql: ${TABLE}.algorithm ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: metric_name {
    type: string
    sql: ${TABLE}.metric_name ;;
  }

  dimension: metric_value {
    type: number
    sql: ${TABLE}.metric_value ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metric_value {
    type: sum
    sql: ${metric_value} ;;
  }

  measure: average_metric_value {
    type: average
    sql: ${metric_value} ;;
  }

  measure: count {
    type: count
    drill_fields: [metric_name]
  }
}
