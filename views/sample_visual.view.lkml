view: sample_visual {
    derived_table: {
      sql: select version,build as days,'build' as stage from
            `tgs-internal-saige-sandbox-001.mlops_artifacts.lifecycle-model-table`
            union all
            select version,ready_to_prod as days,'ready to prod' as stage from
            `tgs-internal-saige-sandbox-001.mlops_artifacts.lifecycle-model-table`
            union all
            select version,prod as days,'prod'as stage from
            `tgs-internal-saige-sandbox-001.mlops_artifacts.lifecycle-model-table` ;;
    }
    dimension: version {
      type: string
      sql: ${TABLE}.version ;;
    }
    dimension: stage {
      type:string
      sql: ${TABLE}.stage ;;
    }
    measure: days {
      type: sum
      sql: ${TABLE}.days ;;
    }

    dimension: sequence {
      type: number
      sql: case when ${stage}='build' then 1
            when ${stage}='ready to prod' then 2
            when ${stage}='prod'then 3
            else
            0
            end;;
    }

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: sample_visual {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }