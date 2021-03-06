from flask import Flask, render_template, request, abort, redirect
from flask.ext.sqlalchemy import SQLAlchemy

import base62

from os.path import realpath, dirname, join
from threading import Lock
import httplib

app = Flask(__name__)

here = dirname(realpath(__file__))
db_file = join(here, 'db.sqlite')

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///{}'.format(db_file)
db = SQLAlchemy(app)

# Global link count
link_count = None
count_lock = Lock()


class Link(db.Model):
    short = db.Column(db.Text, primary_key=True)
    long = db.Column(db.Text)
    hits = db.Column(db.Integer)

    def __init__(self, short, long):
        self.short = short
        self.long = long
        self.hits = 0

    def __repr__(self):
        return '<Link> {short}->{long} [{hits}]'.format(**self.__dict__)


def next_id():
    global link_count

    with count_lock:
        link_count += 1
        return base62.encode(link_count)


@app.route('/', methods=['GET', 'POST'])
def index():
    error = None
    short = None

    if request.method == 'POST':
        url = request.form['url'].strip()
        if not url:
            error = 'no url'
        else:
            short = next_id()
            link = Link(short, url)
            db.session.add(link)
            db.session.commit()

    return render_template(
        'index.html',
        link_count=link_count,
        error=error,
        short=short,
    )


@app.route('/u/<key>')
def short(key):
    link = db.session.query(Link).get(key)
    if link is None:
        abort(httplib.NOT_FOUND)

    # Don't use link.hits += 1 to avoid race conditions
    link.hits = Link.hits + 1
    db.session.commit()

    return redirect(link.long)


if __name__ == '__main__':
    db.create_all()
    link_count = db.session.query(Link).count()

    app.run(debug=True)
