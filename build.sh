#!/bin/sh

pandoc -s main.md -o output/main.html
pandoc -s main.md -o output/main.pdf
pandoc -s main.md -o output/main.epub
