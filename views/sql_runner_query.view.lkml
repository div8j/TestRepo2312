
view: sql_runner_query {
  derived_table: {
    sql: SELECT
          (YEAR(CONVERT_TZ(order_items.returned_at ,'UTC','America/Los_Angeles'))) AS `order_items.returned_year`,
          orders.status  AS `orders.status`,
          COUNT(DISTINCT orders.id ) AS `orders.count`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
      GROUP BY
          1,
          2
      ORDER BY
          (YEAR(CONVERT_TZ(order_items.returned_at ,'UTC','America/Los_Angeles'))) DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_returned_year {
    type: number
    sql: ${TABLE}.`order_items.returned_year` ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.'orders.id' ;;
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  set: detail {
    fields: [
        order_items_returned_year,
  orders_status,
  orders_count
    ]
  }
}
