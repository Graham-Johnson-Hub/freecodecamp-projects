#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Welcome to My Salon ~~~~~\n"

# Function to display the main menu
display_main_menu() {
    echo "Here are our services:"
    echo ""
    
    # Get services from database
    SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
    
    # Format and display services
    echo "$SERVICES" | while IFS='|' read -r service_id service_name; do
        if [[ ! -z "$service_name" ]]; then
            # Remove whitespace
            service_id=$(echo "$service_id" | xargs)
            service_name=$(echo "$service_name" | xargs)
            echo "$service_id) $service_name"
        fi
    done
    
    echo ""
}

# Main program
while true; do
    # Display services menu
    display_main_menu
    
    # Prompt for service selection
    echo -e "\nPlease enter the service id:"
    read SERVICE_ID_SELECTED
    
    # Validate service ID is a number
    if [[ ! "$SERVICE_ID_SELECTED" =~ ^[0-9]+$ ]]; then
        echo "That is not a valid number."
        continue
    fi
    
    # Check if service exists
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
    SERVICE_NAME=$(echo "$SERVICE_NAME" | xargs)
    
    if [[ -z "$SERVICE_NAME" ]]; then
        echo "I could not find that service. Please try again."
        continue
    fi
    
    # Get customer phone number
    echo -e "\nPlease enter your phone number:"
    read CUSTOMER_PHONE
    
    # Check if customer exists
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    CUSTOMER_NAME=$(echo "$CUSTOMER_NAME" | xargs)
    
    # If customer doesn't exist, get their name
    if [[ -z "$CUSTOMER_NAME" ]]; then
        echo -e "\nPlease enter your name:"
        read CUSTOMER_NAME
        
        # Insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi
    
    # Get service time
    echo -e "\nPlease enter the time you would like to schedule your appointment:"
    read SERVICE_TIME
    
    # Get customer_id for the appointment
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    CUSTOMER_ID=$(echo "$CUSTOMER_ID" | xargs)
    
    # Insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    
    # Output confirmation message
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    
    # Exit the script after successful appointment booking
    exit 0
done

