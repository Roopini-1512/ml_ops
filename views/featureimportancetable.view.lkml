# The name of this view in Looker is "Featureimportancetable"
view: featureimportancetable {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `tgs-internal-saige-sandbox-001.mlops_artifacts.feature-importance-table`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Feature Importance" in Explore.

  dimension: feature_importance {
    type: number
    sql: ${TABLE}.Feature_Importance ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_feature_importance {
    type: sum
    sql: ${feature_importance} ;;
  }

  measure: average_feature_importance {
    type: average
    sql: ${feature_importance} ;;
  }

  dimension: feature_names {
    type: string
    sql: ${TABLE}.Feature_Names ;;
  }

  dimension: use_case {
    type: string
    sql: ${TABLE}.Use_Case ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
