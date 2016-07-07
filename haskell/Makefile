
all: BevezetoNyariEgyetem2016.html

%.html: %.lhs
	pandoc -s -t slidy $< -f markdown+lhs -o $@ --slide-level=1 --indented-code-classes=haskell
