view: sample_visual {
  derived_table: {
    sql: select usecase,build as days,'build' as stage from
    `tgs-internal-saige-sandbox-001.mlops_artifacts.lifecycle-model-table`
    union all
    select usecase,ready_to_prod as days,'ready to prod' as stage from
    `tgs-internal-saige-sandbox-001.mlops_artifacts.lifecycle-model-table`
    union all
    select usecase,prod as days,'prod'as stage from
    `tgs-internal-saige-sandbox-001.mlops_artifacts.lifecycle-model-table` ;;
  }
  dimension: usecase {
    type: string
    sql: ${TABLE}.usecase ;;
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
    html: {{rendered_value}} <br> Days: {{days._rendered_value}};;
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
