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
 }
