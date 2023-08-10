view: derivied_test  {
    derived_table: {
      explore_source: order_items {
        column: status { field: orders.status }
        column: id { field: orders.id }
        column: retail_price { field: products.retail_price }
        column: id { field: products.id }
        column: count { field: products.count }
      }
    }
    dimension: status {
      description: ""
    }
    dimension: id {
      description: ""
      type: number
    }
    dimension: retail_price {
      description: ""
      type: number
    }
    dimension: test_id {
      description: ""
      type: number
    }
    dimension: count {
      description: ""
      type: number
    }
  }
