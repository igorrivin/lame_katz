# Simple Makefile
.PHONY: pdf scan

pdf:
	cd tex && pdflatex -interaction=nonstopmode main.tex

scan:
	cd code && sage lame_pcurvature.sage --bound 200 --alpha binomial --list both
