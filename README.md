# DinerDash - Ruby on Rails Project

## Overview

DinerDash is an online ordering system for restaurants built with Ruby on Rails. It provides customers with the ability to order food and restaurant administrators with the tools to manage and fulfill those orders efficiently.

## Features

### Unauthenticated Users

As an unauthenticated user, you can:

- Browse all items.
- Browse items by category.
- Add items to your cart.
- View your cart.
- Adjust the quantity of items in your cart.
- Log in (without losing items in your cart).

### Authenticated Users (Non-Administrators)

As an authenticated non-administrator, you can:

- Do everything an unauthenticated user can except "log in."
- Log out.
- View past orders with detailed information.
- Access order details, including items, prices, and order status.

### Administrators

As an authenticated administrator, you can:

- Create and manage item listings, categories, and prices.
- Retire items from the menu.
- Access an order dashboard to monitor and manage orders.

## Data Validity

Entities within the system must adhere to certain data requirements, ensuring valid records. Any attempt to create or modify records with invalid attributes will trigger validation errors with suggestions for correction.

## Example Data (Seeds)

For evaluation purposes, the project includes sample data accessible via the `rake db:seed` task:

- Items: A variety of items, some attached to multiple categories.
- Categories: At least five categories.
- Orders: A minimum of ten sample orders at various stages of fulfillment.
- Users: User accounts with both normal and administrator privileges.

## Note

- Authentication is implemented using the `Devise` gem.
- Authorization is managed through the `Pundit` gem.
