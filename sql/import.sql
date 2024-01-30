-- Copying all 10 datasets except for data.csv
\COPY Categories(category_id, category_name) FROM '/Users/owenzhang/Desktop/eng-intern-assessment-data/data/category_data.csv' WITH CSV HEADER;
\COPY Products(product_id, product_name, description, price, category_id) FROM '/Users/owenzhang/Desktop/eng-intern-assessment-data/data/product_data.csv' WITH CSV HEADER;
\COPY Users(user_id, username, email, password, address, phone_number) FROM '/Users/owenzhang/Desktop/eng-intern-assessment-data/data/user_data.csv' WITH CSV HEADER;
\COPY Orders(order_id, user_id, order_date, total_amount) FROM '/Users/owenzhang/Desktop/eng-intern-assessment-data/data/order_data.csv' WITH CSV HEADER;
\COPY Order_Items(order_item_id, order_id, product_id, quantity, unit_price) FROM '/Users/owenzhang/Desktop/eng-intern-assessment-data/data/order_items_data.csv' WITH CSV HEADER;
\COPY Reviews(review_id, user_id, product_id, rating, review_text, review_date) FROM '/Users/owenzhang/Desktop/eng-intern-assessment-data/data/review_data.csv' WITH CSV HEADER;
\COPY Cart(cart_id, user_id) FROM '/Users/owenzhang/Desktop/eng-intern-assessment-data/data/cart_data.csv' WITH CSV HEADER;
\COPY Cart_Items(cart_item_id, cart_id, product_id, quantity) FROM '/Users/owenzhang/Desktop/eng-intern-assessment-data/data/cart_item_data.csv' WITH CSV HEADER;
\COPY Payments(payment_id, order_id, payment_date, payment_method, amount) FROM '/Users/owenzhang/Desktop/eng-intern-assessment-data/data/payment_data.csv' WITH CSV HEADER;
\COPY Shipping(shipping_id, order_id, shipping_date, shipping_address, tracking_number) FROM '/Users/owenzhang/Desktop/eng-intern-assessment-data/data/shipping_data.csv' WITH CSV HEADER;