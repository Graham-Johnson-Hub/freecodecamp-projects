def apply_discount(price, discount):
    # Check if price is a number (int or float, excluding boolean since bool is a subclass of int in Python)
    if not isinstance(price, (int, float)) or isinstance(price, bool):
        return "The price should be a number"
    
    # Check if discount is a number (int or float, excluding boolean)
    if not isinstance(discount, (int, float)) or isinstance(discount, bool):
        return "The discount should be a number"
    
    # Check if price is greater than 0
    if price <= 0:
        return "The price should be greater than 0"
    
    # Check if discount is between 0 and 100 inclusive
    if discount < 0 or discount > 100:
        return "The discount should be between 0 and 100"
    
    # Calculate and return the final price
    final_price = price * (1 - discount / 100)
    return final_price