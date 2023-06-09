# Define the database connection to be used for this model.
connection: "bigquery-sandbox"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: ml_ops_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ml_ops_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Ml Ops"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: monitoringinfotable {}

explore: _evaluationreadyprodtable {}

explore: experimentationbuildtable {}

explore: tbl_feature_importance {}

explore: lifecyclemodeltable {}

explore: onlineskewinfotable {}

explore: tbl_algorithms_performance {}

explore: productionmodeltable {}

explore: tbl_trained_model_output {}

explore: tbl_final_model_performance {}

explore: tbl_features_vif {}

explore: sample_visual {}

explore: onlinedriftinfotable {}

explore : featureimportancetable {}

explore: churndrift {}

explore: churnfeatureimportance {}

explore: churnskew {}

explore: churntestaccuracy {}
