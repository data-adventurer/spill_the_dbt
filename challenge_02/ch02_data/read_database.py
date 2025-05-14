import duckdb

# Connection to the database file called 'library.db'
con = duckdb.connect("ch02_data/library.db")

show_tables = """
    SELECT * FROM pg_catalog.pg_tables;
"""
tables = con.execute("SHOW TABLES").fetchall()
# Loop through each table and get its columns
for table in tables:
    table_name = table[0]
    print(f"Columns in table '{table_name}':")
    columns = con.execute(f"PRAGMA table_info({table_name})").fetchall()
    for col in columns:
        print(f"  - {col[1]} ({col[2]})")  # col[1] is the column name, col[2] is the data type
    print()

# See an output of all the tables
con.sql(show_tables).show()

# Load the sql_query and run it
fd = open('ch02_data/customers_with_late_fees.sql', 'r')
sql_query = fd.read()
fd.close()

con.sql(sql_query).show()

# explicitly close the connection
con.close()
