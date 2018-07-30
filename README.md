# Temply.sh

Stupid template manager for starting markdown docs

This shell script reads a document template name and starts your preferred editor with a copied template ready to be filled.

## Usage

Let's imagine that we have a template named `meeting.md` in your configuration directory:

```bash
temply.sh meeting weekly-meeting
```

temply will copy the `meeting.md` template into your defined output directory, it will name it `YYYY-MM-DD-HH-MM-SS-weekly-meeting.md` and it will start your
preferred editor with this file.

## Configuration

The shell script is expecting you to have a `.temply` directory in your `$HOME`, inside this directory it should have:

### Configuration file

`temply.cnf`

```bash
TEMPLY_EDITOR=/usr/bin/code                  # if this is not set it will default to /usr/bin/vim
OUTPUT_DIRECTORY=/home/you/notes             # if this is not set it will default to $HOME
```

### Templates

There is a `templates` directory with all the templates. They should have the `.md` suffix. 
