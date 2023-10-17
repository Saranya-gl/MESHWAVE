import sqlite3

conn = sqlite3.connect("Fishbook.db")
conn.execute('PRAGMA foreign_keys = ON')
cur = conn.cursor()

final = '''
CREATE TABLE final_table (
    sail_id INTEGER PRIMARY KEY,
    sail_date DATE,
    return_date DATE,
    tot_rev FLOAT,
    tot_exp FLOAT,
    tot_prof FLOAT
)
'''

reve = '''
CREATE TABLE revenue (
    sail_id INTEGER,
    revenue_1 FLOAT,
    revenue_2 FLOAT,
    other_revenue FLOAT,
    FOREIGN KEY (sail_id) REFERENCES final_table(sail_id)
)
'''

exp = '''
CREATE TABLE expenses (
    sail_id INTEGER,
    expenses_1 FLOAT,
    expenses_2 FLOAT,
    other_expenses FLOAT,
    FOREIGN KEY (sail_id) REFERENCES final_table(sail_id)
)
'''

owner_prof = '''
CREATE TABLE owner_prof (
    sail_id INTEGER,
    owner_percent FLOAT,
    crew_percent FLOAT,
    rem_amt FLOAT,
    FOREIGN KEY (sail_id) REFERENCES final_table(sail_id)
)
'''

work = '''
CREATE TABLE work (
    sail_id INTEGER,
    work TEXT,
    amount FLOAT,
    payment INTEGER,
    progress INTEGER,
    incharge TEXT,
    FOREIGN KEY (sail_id) REFERENCES final_table(sail_id)
)
'''

own = '''
CREATE TABLE owner (
    own_no INTEGER PRIMARY KEY,
    name TEXT,
    pending_payment FLOAT,
    advance_payment FLOAT,
    tot_amt FLOAT
)
'''

crew = '''
CREATE TABLE crew (
    crew_no INTEGER PRIMARY KEY,
    name TEXT,
    pending_payment FLOAT,
    advance_payment FLOAT,
    tot_amt FLOAT
)
'''

a = [final, reve, exp, owner_prof, own, crew, work]

for i in a:
    cur.execute(i)

conn.commit()
conn.close()
