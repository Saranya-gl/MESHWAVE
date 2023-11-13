import os
from flask import Flask, jsonify, request, send_from_directory
import sqlite3
import matplotlib.pyplot as plt
from flask_cors import CORS  

def tab(year):
    conn = sqlite3.connect('Fishbook.db')
    cur = conn.cursor()

    cur.execute("SELECT strftime('%m', return_date), tot_rev, tot_exp, tot_prof FROM final_table WHERE strftime('%Y', return_date) = ? ORDER BY return_date ASC", (str(year),))
    rows = cur.fetchall()
    data = {}
    month = []
    rev = []
    exp = []
    prof = []
    months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    
    for row in rows:
        month.append(int(row[0]))
        rev.append(row[1])
        exp.append(row[2])
        prof.append(row[3])

    Xbel = [months[x - 1] for x in month]
    data['month'] = Xbel
    data['rev'] = rev
    data['exp'] = exp
    data['prof'] = prof

    return data

def main(year):
    conn = sqlite3.connect('Fishbook.db')
    cur = conn.cursor()

    cur.execute("SELECT strftime('%m', return_date), tot_rev, tot_exp, tot_prof FROM final_table WHERE strftime('%Y', return_date) = ? ORDER BY return_date ASC", (str(year),))
    rows = cur.fetchall()

    x_ = []
    y_rev = []
    y_exp = []
    y_prof = []

    barwidth = 0.3

    for row in rows:
        x_.append(int(row[0]))
        y_rev.append(row[1])
        y_exp.append(row[2])
        y_prof.append(row[3])

    conn.commit()
    conn.close()

    x1 = x_
    x2 = [x + barwidth for x in x1]
    x3 = [x + barwidth for x in x2]

    months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    X_Label = [months[x - 1] for x in x1]

    fig = plt.figure()
    fig.set_facecolor('#F0F0F0')  

    colors_exp = '#c44e55'
    colors_rev = '#edce9e'
    colors_prof = '#675a85'

    plt.bar(x1, y_exp, width=barwidth, label="Expenses", color=colors_exp)
    plt.bar(x2, y_rev, width=barwidth, label="Revenue", color=colors_rev)
    plt.bar(x3, y_prof, width=barwidth, label="Profit", color=colors_prof)

    plt.xlabel('Months')
    plt.xticks(x1, X_Label)
    plt.legend()

    image_path = os.path.join('static', 'Chart_Representation.png')
    plt.savefig(image_path)
    plt.close()  # Close the figure to release resources

    return image_path

app = Flask(__name__)
CORS(app)

@app.route('/api/data', methods=['GET'])
def get_data():
    year = request.args.get('year')
    data = {}
    if year is not None:
        data = tab(int(year))
    return jsonify(data)

@app.route('/get_image', methods=['GET'])
def get_image():
    year = request.args.get('year')
    if year is not None:
        image_path = main(int(year))
        return send_from_directory(os.path.dirname(image_path), os.path.basename(image_path))
    return 'Year not provided', 400

if __name__ == '__main__':
    app.run(debug=True)


