# update-log

A minimal HTML page (`index.html`) that keeps a log of every time it is updated.

A GitHub Actions workflow (`.github/workflows/ci.yml`) runs `update.sh` every 10 minutes,
which appends a timestamped entry to the page, commits the change back to the repo,
and publishes the page to GitHub Pages at https://jiaminlim.github.io/update-log/.

Run it locally:

```sh
./update.sh
```
