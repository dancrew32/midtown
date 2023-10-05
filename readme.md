# Midtown

Simple script to scrape http://midtownterrace.org/ banner image and let me know when it updates.

```
make venv deps run
```

Mac crontab

```
0 21,22,23 * * * /Users/dan/src/midtown/venv/bin/ipython /Users/dan/src/midtown/midtown.py
```
