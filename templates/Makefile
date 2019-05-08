# Base Makefile for AsciiDoc editing.
# For book, doc, slides, etc...

# The source and target files.
# Source will be processed into targets.
SRC = src/*.adoc
TARGET = index.{html,pdf}

# Commands that will be used.
MAKE = make
RM = rm -f
ASCIIDOC = asciidoctor	# Use `asciidoc` for slides.
ASCIIDOCBACKEND = html5	# Use `slidy` for slides.

# Add this to the target that $(MAKE) points to to automatically refresh the
# current tab in Firefox.
REFRESHBROWSERTAB = ~/bin/ffreload

default: clean
	$(ASCIIDOC) -b $(ASCIIDOCBACKEND) $(SRC)

clean:
	$(RM) $(TARGET)

# Basic http server, good enough to serve static html locally
server:
	python3 -m http.server

# Watch the source files for changes and build.
watcher:
	fswatch -l 0.2 -o $(SRC) | xargs -n1 -I{} $(MAKE)

