#!/usr/bin/env bash

# ---------- Configuration ---------------

DEFAULT_TITLE_PREFIX="New Note"
DEFAULT_NOTEBOOK="InBox"
AUTO_CREATE_NOTEBOOK=false
LOCKFILE_DURATION=600
MAX_THUMBNAILS=1

# Convert incoming documents to Markdown for the note body using Microsoft
# markitdown. Set to "false" to disable. Original file is always still attached.
MARKITDOWN_ENABLED=true

# Comma-separated lowercase extensions handled by markitdown. Must match what
# the markitdown extras installed in the Dockerfile actually support.
# PDFs and images are routed separately and do NOT belong in this list.
MARKITDOWN_EXTENSIONS="docx,pptx,xlsx,xls,html,htm,csv,epub,msg,json,xml,odt"

# ---------- Advanced Configuration ------

TEMP_APPEND_FILE="/tmp/jg-temporary-content"
