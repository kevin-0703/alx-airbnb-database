# Database Normalization – Airbnb Experiment

## 1. First Normal Form (1NF)

- Ensure all tables have atomic attributes and unique records.
- **Analysis:**
  - `first_name` and `last_name` are separate columns in the User table.
  - `total_price` in Booking, `pricepernight` in Property, and `rating` in Review are all atomic.
  - Each table has a primary key to uniquely identify records.
- ✅ Conclusion: All tables comply with 1NF.

## 2. Second Normal Form (2NF)

- All non-key attributes must depend fully on the primary key.
- **Analysis:**
  - Booking: `total_price` depends on `booking_id`, not part of a composite key.
  - Property: `location`, `name`, `description`, `pricepernight` depend on `property_id`.
  - Payment: `amount`, `payment_method`, `payment_date` depend on `payment_id`.
- ✅ Conclusion: All tables comply with 2NF.

## 3. Third Normal Form (3NF)

- No non-key attribute depends on another non-key attribute (no transitive dependency).
- **Analysis:**
  - Property table references `host_id` (FK) rather than storing host info redundantly.
  - Booking references `user_id` and `property_id` (FKs) without duplicating user or property data.
  - Review references `user_id` and `property_id` without storing user or property details.
  - Payment references `booking_id` and stores only payment-specific info.
- ✅ Conclusion: All tables comply with 3NF. No further decomposition required.

## 4. Summary

- The Airbnb database schema is normalized to **3NF**.
- Benefits of normalization achieved:
  - Minimal redundancy
  - Improved data integrity
  - Efficient storage and query performance
