import sqlite3
from datetime import date,datetime,timedelta
import random
def main():

 
    

    conn =sqlite3.connect("Fishbook.db")
    cur =conn.cursor()
    for i in range(0,500):
        
        sail_year = random.randint(2003,2023)
        sail_month = random.randint(1,11)
        da_i_mnt =  (datetime(sail_year,sail_month+1,1)-datetime(sail_year,sail_month,1)).days
        sail_day=random.randint(1,da_i_mnt)
        sail_date=datetime(sail_year,sail_month,sail_day)
        ret_year=random.randint(sail_year,2023)
        ret_date=datetime(ret_year,sail_month,sail_day)
        rev1=random.randint(10000,2000000)
        rev2=random.randint(10000,2000000)
        orev=random.randint(10000,2000000)
        trev=rev1+rev2+orev
        exp1=random.randint(10000,50000)
        exp2=random.randint(10000,50000)
        oexp=random.randint(10000,50000)
        texp=exp1+exp2+oexp
        tprof=trev-texp
        own_pre=tprof*(40/100)
        crew_pre =tprof*(30/100)
        rem_amt=own_pre-crew_pre
        cur.execute('INSERT INTO revenue VALUES(?,?,?,?)',(i,rev1,rev2,orev))
        cur.execute('INSERT INTO owner_prof VALUES(?,?,?,?)',(i,own_pre,crew_pre,rem_amt))
        cur.execute('INSERT INTO expenses VALUES(?,?,?,?)',(i,exp1,exp2,oexp))
        cur.execute('INSERT INTO final_table VALUES(?,?,?,?,?,?)',(i,sail_date,ret_date,trev,texp,tprof))
        conn.commit()
        
  
    tables=['final_tabLe','revenue','expenses','owner_prof']
    for i in tables:
    
        cur.execute('Select * from {}'.format(i))
        rows = cur.fetchall()
        print('Table {}'.format(i))
        for val in rows:
            print(val)
    conn.close()
   
    
    


if __name__=='__main__':
    main()




