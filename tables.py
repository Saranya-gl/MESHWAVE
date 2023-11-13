import sqlite3

# Connect to SQLite database or create a new one if it doesn't exist
connection = sqlite3.connect('Fishbook.db')

# Create a cursor object
cur = connection.cursor()

# Create the 'users' table
cur.execute('''
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        phone_number VARCHAR(15) NOT NULL,
        password VARCHAR(255) NOT NULL
    )
''')

# Commit the changes and close the connection
connection.commit()
connection.close()

print("Database and table created successfully!")
