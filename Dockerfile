From texlive/texlive:latest AS builder

WORKDIR /app
COPY main.tex .

RUN latexmk -pdf main.tex

CMD ["bash"]

