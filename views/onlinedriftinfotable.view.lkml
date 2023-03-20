# The name of this view in Looker is "Onlinedriftinfotable"
view: onlinedriftinfotable {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `tgs-internal-saige-sandbox-001.mlops_artifacts.online-drift-info-table`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Drift" in Explore.

  dimension: drift {
    type: number
    sql: ${TABLE}.drift ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_drift {
    type: sum
    sql: ${drift} ;;
  }

  measure: average_drift {
    type: average
    sql: ${drift} ;;
  }

  dimension: features {
    type: string
    sql: ${TABLE}.features ;;
  }

  measure: drift1 {
    type: sum
    sql: ${TABLE}.drift;;
    html: {{rendered_value}} <br> feature: {{features._rendered_value}};;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: job_id {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.job_id ;;
  }

  dimension: threshold {
    type: number
    sql: ${TABLE}.threshold ;;
  }

  dimension: usecase {
    type: string
    sql: ${TABLE}.usecase ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
