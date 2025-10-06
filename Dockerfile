# Stage 1: Build the PDF
FROM texlive/texlive:latest AS builder

WORKDIR /app

# Copy LaTeX file(s)
COPY resume.tex .

RUN latexmk -pdf main.tex


# Stage 2: Minimal image for S3 upload
FROM amazon/aws-cli:latest

WORKDIR /app

# Copy the PDF from builder
COPY --from=builder /app/resume.pdf ./resume.pdf
COPY entrypoint.sh ./entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

