# The name of this view in Looker is "Tbl Trained Model Output"
view: tbl_trained_model_output {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `tgs-internal-saige-sandbox-001.mlops_artifacts.tbl_trained_model_output`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Accuracy" in Explore.

  dimension: accuracy {
    type: number
    sql: ${TABLE}.Accuracy ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_accuracy {
    type: sum
    sql: ${accuracy} ;;
  }

  measure: average_accuracy {
    type: average
    sql: ${accuracy} ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.Date ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}.Model_Name ;;
  }

  measure: count {
    type: count
    drill_fields: [model_name]
  }
}
